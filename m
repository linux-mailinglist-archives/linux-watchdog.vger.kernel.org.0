Return-Path: <linux-watchdog+bounces-4035-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296FB30A91
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 03:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E339EA06889
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 00:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A653178372;
	Fri, 22 Aug 2025 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0Y9XJqV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D5347C7;
	Fri, 22 Aug 2025 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755824312; cv=none; b=GzZBY+oaKEvj40/BVpmY6LVh6IMus+e/IH/7y9B0w02f3+crUK/LJ9X8EgvjrPx3NhbahqwyVTtiSDlyfszqPhWcH+iiLNfvvXA+Y/XIZV0kSQt/aLueUiN4GPpqcy3G6mmmoGtXHM8rGFIX/dUTQlaEOY8VLase9PxqbSA9g8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755824312; c=relaxed/simple;
	bh=pI8wKsf8uAxXInNw8qE22IYRaoUiFkgFmGC3/Qwm5I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClD5GMrtI/gvo7DIZ+mv8pzwyLAz9gFU/pJ1KSoNTbOKyfisEmEjbi7fTZiUfKuUEx5fazVq2bF+58ADb9OzTyQr50v+WAmOIX0UZKwM5o/sEZQPsFETVofTCta+SedK4hffPVBILz4fVfI97AG4bdIJtW+hCaInmPR/4U0Z5t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0Y9XJqV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B849AC4CEED;
	Fri, 22 Aug 2025 00:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755824312;
	bh=pI8wKsf8uAxXInNw8qE22IYRaoUiFkgFmGC3/Qwm5I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0Y9XJqVei3rwjosFgiyvTus/kOCXUXSIUfA1RKvv1WlgUrOAjQsZ1HFNS5m9fhgF
	 z0NhZKznsybOS2f6RUatmaMiKXfWEnEInuFt5iCY+bzrWrIAl7EhyFyJ4qQnLXIOUm
	 JMzPt+fSFwbqpTnx6peA3vfvk0d3FC2ZZGo1g/wRlgJTfWqUeGARPOKupujYm3UdV+
	 AAn63fp1Fyn5ZJja+oEqsKljNUOwZnuOB7uXPSIbX40EBHvN4PGWCHozstVKq47Gfx
	 hTJ2+ZGmb3S8DaKni6x366N/sM2rNDCALVtMz3gBJ37lJ1/aeBxJsKlv4FFnRzIGwv
	 V9HDlYKM+2vAw==
Date: Fri, 22 Aug 2025 08:41:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: timer: Add ARM SSE(Subsystems for
 Embedded) timer
Message-ID: <aKe8rd7kFy8SLVBA@xhacker>
References: <20250821152429.26995-1-jszhang@kernel.org>
 <20250821152429.26995-2-jszhang@kernel.org>
 <175581575625.1136124.14166801245928231276.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175581575625.1136124.14166801245928231276.robh@kernel.org>

On Thu, Aug 21, 2025 at 05:39:48PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 21 Aug 2025 23:24:28 +0800, Jisheng Zhang wrote:
> > Add binding doc for the ARM SSE(Subsystems for Embedded) timer. Here
> > is the document URL:
> > https://developer.arm.com/documentation/107610/0000/System-timer-components?lang=en
> > 
> > Although the IP is mostly seen on MCU SoC platforms, but nothing
> > prevent it from being integrated into linux capable SoC platforms.
> > 
> > The IP core may have a system counter to generate timestamp value,
> > a system timer to raise an interrupt when a period has elapsed, and
> > a System Watchdog to detect errant system behaviour then reset the
> > system if a period elapses without ping.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/timer/arm,sse_timer.yaml         | 90 +++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Oops, thanks for the hint. I would like to collect feedbacks to the
implementation itself, then fix the dt errors/warnings in v2.

Thanks
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/timer/arm,sse_timer.yaml:43:111: [warning] line too long (145 > 110 characters) (line-length)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml: patternProperties:^frame@[0-9a-f]+$:properties:interrupts: 'oneOf' conditional failed, one must be fixed:
> 	[{'description': 'timer irq'}] is too short
> 	False schema does not allow 1
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250821152429.26995-2-jszhang@kernel.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

