Return-Path: <linux-watchdog+bounces-4555-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B38C4F0D3
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 17:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 723553B9E7E
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 16:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC16C36CE08;
	Tue, 11 Nov 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joznMm13"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F312080C1;
	Tue, 11 Nov 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762878855; cv=none; b=TUCz1r5wm8oeYFuwICy2aWd/XjlvrVTIuyV0vRt1G8dhzqRSPk6VVplP6pr07vfaIPROHNbJS+JeSLlBcwj5UdHVWwJ9thvTV2yHKEvTzxXI5ueUvyMYaXJ6wh720nNYLYLJTw1Jly0nT0hI9PRB6lI2VZYljgCLAjggch9cVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762878855; c=relaxed/simple;
	bh=o/SZWMBbQ0JCS1M9ZO5LlTR4JXs77rGENL4pHZrJbVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQwe5e+E56q7mq1qm7ncn0H83+VJklSHAOSoykXlcX2QUxpgJ/iLqbcE/Qqbt/0pZqkuuU4VkD6iGJ3e0OZh6FRkMspWnmh3lrjUldfefwZN8xFe6E2vZM26CT27juPfbYLRK6QCJp9M53lO0gZd/lsZwLceyDR6PBqOT1ykFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joznMm13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEE5C113D0;
	Tue, 11 Nov 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762878855;
	bh=o/SZWMBbQ0JCS1M9ZO5LlTR4JXs77rGENL4pHZrJbVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joznMm13PDNcKA7KhYms1P5FFb4cNMGS9aern9MJrSIPX5KS/7NkjxI1N/EVpM0v9
	 HhXf52URqZ97j1UmHBT2bkeeJKG6dlWDNuKek4LY36GF4ooFcIlWgpiRAEHD6KPUd5
	 kPBdB7n3MSmCHjqPSPokd9Hl0O99YEdngmHkXu7g4BC8VcG7d8qE2ngpSdCeghA7sf
	 Zvrm66Hshf1UH6ibPYpFXolOFCsNMru2H0PyyvBy0oMac943AT47Hm8B86t7zvkl1u
	 7/BD3U5zeVw678NtertiCmEUune4xNx4eSxfFhgqxcNPnrbWW3VfzgP9efc3Qov9t6
	 jGbYGpfxFtiwA==
Date: Tue, 11 Nov 2025 10:38:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <rt777beinysf5nuy57frn7okwglsl77xqikmvobao32bznhnkf@mzg243ddzlpl>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>

On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > +
> > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > +}
> > > > +
> > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev;
> > > > +	struct device_node *np;
> > > > +	bool of_wdt_available;
> > > > +	int i;
> > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > 
> > > static const?
> > > 
> > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > +	static const char * const of_wdt_compatible[] = {
> > > > +		"qcom,kpss-wdt",
> > > > +		"arm,sbsa-gwdt",
> > > > +	};
> > > > +
> > > > +	/* Bail out if we are not running under Gunyah */
> > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > +		return;
> > > 
> > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > 
> > 
> > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > 
> 
> Dmitry / Bjorn,
> 
> We are debating on this internally on how to resolve this dependency
> 
> - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
>   QCOM_SCM compilation than what it is today.

What does that imply? What is the actual impact? (Do I need to go read
the dependency tree myself?)

> 
> - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver 
> 
> - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
>   for any of the functions defined in drivers/firmware/smccc/smccc.c
> 
> We are trending towards the first option above. Please let us know if
> you think otherwise.

What is this trend driven by? Is it coin toss or is there a reason? My
gut feeling is trending towards one of the latter two options...

But you're effectively asking us to go research these three options,
determine the pros/cons and then tell you what we think, at which point I
presume you will tell us what you think about each option.

It would be better if you made a suggestion and told us why you think
this is the best choice - then we can either agree with your reasoning,
or choose to ask more questions or do some research.

Regards,
Bjorn

> Thanks,
> Pavan

