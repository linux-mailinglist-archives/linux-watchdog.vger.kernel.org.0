Return-Path: <linux-watchdog+bounces-4561-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CACC53876
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 17:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CC41505D5C
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 16:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C3C29D28F;
	Wed, 12 Nov 2025 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eICHlZjl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1135CBC9;
	Wed, 12 Nov 2025 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762964517; cv=none; b=enpXPUYIUf++L+wGie7xXIiEQ5JAx72A6E2HpW0fvakr6U6sH7Bq3jenCK5Qk09fmtdY+g3YLEWLRt8QOzhTT7CETy4Ob/90FCRmfPoxA2+ggJubBoM5YvZJ34sVOTKYW/sConFSH9unhwigfM3GBv/3y9RzOkpX+FHWhg+fGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762964517; c=relaxed/simple;
	bh=Zh168JDIc9MiMw3gLGbFf968cd68Wl7hb46fJ2WOYuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBr1u8TAsjDiXOQGl88OgpMLrrkeJpS0VACFO4SpHkw3TjqEbmqdAJZyYt92EBQvtr0FY8VdYS3pRijo8kgkj//dBJk1+094uzw1MJurd99mbWq4ePaQz8CLjVTjN9Piq3G6NiYxrfXwRI+l/4kPqpKQqAfcfGrU26iCRt0Bn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eICHlZjl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B161C4CEF7;
	Wed, 12 Nov 2025 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762964516;
	bh=Zh168JDIc9MiMw3gLGbFf968cd68Wl7hb46fJ2WOYuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eICHlZjlShpWTATZ3YMOxgYCp41J0414pLfqz8PciAYbQF6prUpL9HQMaDGb+iB69
	 ZPMHj257wv6AAkR11bC3cw40Ks1iFVRyxWQw4tx1y3TLOxgwG+osbAqGJkkJWoKSxR
	 Zx/zX/3JZ7p5/Ix27Rc9kQ9rNS/EsJxzjnVv8tAEVc24Sangy8j56NlzQTI8Mzk2JI
	 RG4OrWAGDA6LyHcLefXpo4zVy8W5nKJFqNX43dJg7/Syp3EayY+GbUV/HvnC13YGVY
	 SsQsvuEZnQ4zb6Z+YpOvchBOwkJDtZzQr9YX7AXw+sRee9xIm7GK8b3qTp8ayihgv2
	 QSYvUd/2nIOqA==
Date: Wed, 12 Nov 2025 10:26:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <55kuc3flqzebmfnrerhkz76jqg23xhmc7wiic5faicwtffozgi@xviskbliwgkq>
References: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <56aqammkwte3tcdzni2unufjp4t4yaqazzdkigrwqsxp3ghcqe@ppe2pjwg3hrl>
 <60583236-692f-4605-9f56-f7dadb46558d@kernel.org>
 <zbwcg5pkdspkcnvaitac6y5iko346qyuzuipqhkoedcaqm2dpa@zmszuwhm5q7z>
 <6bebcf6c-9328-4cd6-b77c-a147338d607a@oss.qualcomm.com>
 <nkh73mo4h5kj2lrz7paop7fn3ow2itxl5vh43muw6n5dxgmco3@tgvbmdxhbiqo>
 <68dbaf42-0d64-45f7-8410-ebcbae2da612@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68dbaf42-0d64-45f7-8410-ebcbae2da612@oss.qualcomm.com>

On Wed, Nov 12, 2025 at 10:07:26AM +0530, Hrishabh Rajput wrote:
> 
> On 11/11/2025 8:35 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 11, 2025 at 07:30:59PM +0530, Hrishabh Rajput wrote:
> > > On 11/11/2025 5:52 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Nov 11, 2025 at 11:41:51AM +0100, Krzysztof Kozlowski wrote:
> > > > > On 11/11/2025 11:34, Dmitry Baryshkov wrote:
> > > > > > On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> > > > > > > On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > > > > > > > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > > > > > > > +{
> > > > > > > > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > > > > > > > +
> > > > > > > > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > > > > > > > +{
> > > > > > > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > > > > > > +	struct device_node *np;
> > > > > > > > > > +	bool of_wdt_available;
> > > > > > > > > > +	int i;
> > > > > > > > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > > > > > > > static const?
> > > > > > > > > 
> > > > > > > > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > > > > > > > +	static const char * const of_wdt_compatible[] = {
> > > > > > > > > > +		"qcom,kpss-wdt",
> > > > > > > > > > +		"arm,sbsa-gwdt",
> > > > > > > > > > +	};
> > > > > > > > > > +
> > > > > > > > > > +	/* Bail out if we are not running under Gunyah */
> > > > > > > > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > > > > > > > +		return;
> > > > > > > > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > > > > > > > 
> > > > > > > > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > > > > > > > 
> > > > > > > Dmitry / Bjorn,
> > > > > > > 
> > > > > > > We are debating on this internally on how to resolve this dependency
> > > > > > > 
> > > > > > > - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
> > > > > > >     QCOM_SCM compilation than what it is today.
> > > > > > > 
> > > > > > > - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver
> > > > > > > 
> > > > > > > - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
> > > > > > >     for any of the functions defined in drivers/firmware/smccc/smccc.c
> > > > > > > 
> > > > > > > We are trending towards the first option above. Please let us know if
> > > > > > > you think otherwise.
> > > > > > The same as before: 'select HAVE_ARM_SMCCC_DISCOVERY'.
> > > > > HAVE_ARM_SMCCC_DISCOVERY has a dependency which is not always selected
> > > > > (e.g. ARM32), thus selecting it might lead to warnings of unmet
> > > > > dependencies.
> > > > Then `if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY))` might be a good
> > > > option here (and depend on GICv3 selecting it).
> > > Thanks a lot Dmitry, wemade the change below and compile tested on various
> > > architectures (ARM64, ARM32, x86, PowerPC, RISC-V and MIPS) and it was
> > > success.
> > > 
> > > We will include it in our next patch version, if there are no further
> > > concerns.
> > > 
> > > }; /* Bail out if we are not running under Gunyah */ - if
> > > (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) + if
> > > (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) || +
> > > !arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) return; /*
> > Unreadable. Don't you read what you are sending?
> 
> Sorry, my mail client messed up the formatting while sending. Here is the
> proper version:
> 
> /* Bail out if we are not running under Gunyah */
> -	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> +	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
> +	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> 		return;

LGTM

> 
> Thanks,
> Hrishabh
> 

