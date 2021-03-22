abstract public class VacationPolicy {
	public void accrueVacation() {
		calculateBaseVacationHours();
		alterForLegalMinimums();
		applyToPayroll();
	}
	private void calculateBaseVacationHours() { /* ... */ };
	abstract protected void alterForLegalMinimums();
	private void applyToPayroll() { /* ... */ };
}

public class USVacationPolicy extends VacationPolicy {
	@Override protected void alterForLegalMinimums() {
		// US specific logic
	}
}

public class EUVacationPolicy extends VacationPolicy {
	@Override protected void alterForLegalMinimums() {
		// EU specific logic
}
