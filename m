Return-Path: <linux-watchdog+bounces-4505-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E81C2EA48
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 01:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDECD4F7134
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 00:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCCF1DE3DF;
	Tue,  4 Nov 2025 00:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JV5dwkzd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9CE13AF2;
	Tue,  4 Nov 2025 00:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216511; cv=none; b=pC2/dprnVLMjW/9lZkz+nM/eJv6TboSxf5ObL+LuXf6KxcUf1X3C3nBok0SvAv5O13B0NOzPcMqOslofVrnm/45p4iaA6AGw2fGK644v8F0BsTN/FUjc/4KgXZRktxflWPIKR15066Ab9YhfYv36/81N3daus+8fZnvs8QjtuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216511; c=relaxed/simple;
	bh=ecE3j/QuPReF1lQC13Cv31CK9ZwdPtU6taEd0JEVHu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbOmLkzFK4k0QHzTDeU2pdof8BDcj8acXIkD34DSB1Bt0NE9WEnb0lb4Rn0OV8fFZ6MDNL1OC/gzXj8JRxntjhAJUK04+O5V8VFBu5YoyVx13YB43I2p2YULIssi0gpM1UeOHfZzxkGX1O39cjSFumVYCxklgcZi6AXwE3+wNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JV5dwkzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323FFC4CEFD;
	Tue,  4 Nov 2025 00:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762216511;
	bh=ecE3j/QuPReF1lQC13Cv31CK9ZwdPtU6taEd0JEVHu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JV5dwkzddOqporZhwxdMYNSID/Gi6ccACFjakENdiZ2bQEKh7UfO/mT5rPNVcuy28
	 JdvIUztXQXlC2oLplOh9wZ8iYhZuKeS2zdywSlhW0cW7spJiyA4dp0c9AzP9dLuWSY
	 cElGkBbMbQGYtG1u1ybmxLOcGrO7btsJmPQUrtMba/sjvEfYCatACXlolkko1uayHz
	 8oXMw8DTKKe/2dgrS+y8tmZpsbNbdJ58aMm24vqzi/DTWKId6RedqPQq/RS8op+7As
	 EKGuZKYBjqz8vD+geT4eVbDbMe4OAY0nkSTDbku5VIAVjIModpHOJlqC2ECvgiNsmX
	 aTtJHE9itvaZg==
Date: Mon, 3 Nov 2025 18:38:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <bzyh2jfmga4zk2x3sb3bhex5d25hnhcdti3gneso4nys36k5as@nnkzk6ersyqi>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <9421ff80-bd86-4b29-baca-c86da90c91aa@roeck-us.net>
 <wxdglhtsss4it6gfm3d7nngi6aezcvpcs44oa5mlmdwe34d5o2@qlkri6oknnpe>
 <931eaa75-52f8-4790-9103-02e97b820c7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <931eaa75-52f8-4790-9103-02e97b820c7f@oss.qualcomm.com>

On Mon, Nov 03, 2025 at 03:23:27PM +0530, Hrishabh Rajput wrote:
> 
> On 11/2/2025 12:20 AM, Bjorn Andersson wrote:
> > On Fri, Oct 31, 2025 at 08:24:44AM -0700, Guenter Roeck wrote:
> > > On 10/31/25 03:18, Hrishabh Rajput via B4 Relay wrote:
> > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > 
> > > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > > register the watchdog device in the SMEM driver.
> > > > 
> > > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > > present in the devicetree. If none of these device nodes are detected,
> > > > we register the SMC-based Gunyah watchdog device.
> > > > 
> > > There should also be an explanation why there is no "qcom,gunyah-wdt"
> > > devicetree node, both here and in the file.
> > > 
> > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > ---
> > > >    drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > > >    1 file changed, 37 insertions(+)
> > > > 
> > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > index cf425930539e..40e4749fab02 100644
> > > > --- a/drivers/soc/qcom/smem.c
> > > > +++ b/drivers/soc/qcom/smem.c
> > > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > > >    	return 0;
> > > >    }
> > > > +static int register_gunyah_wdt_device(void)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev;
> > > > +	struct device_node *np;
> > > > +
> > > > +	/*
> > > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > > +	 * the case.
> > > > +	 */
> > > > +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> > > > +	if (np) {
> > > > +		of_node_put(np);
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> > > > +	if (np) {
> > > > +		of_node_put(np);
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> > > > +							 NULL, 0);
> > > > +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> > > > +}
> > > > +
> > > >    static int qcom_smem_probe(struct platform_device *pdev)
> > > >    {
> > > >    	struct smem_header *header;
> > > > @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
> > > >    	if (IS_ERR(smem->socinfo))
> > > >    		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
> > > > +	ret = register_gunyah_wdt_device();
> > > > +	if (ret)
> > > > +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> > > > +
> > > >    	return 0;
> > > >    }
> > > >    static void qcom_smem_remove(struct platform_device *pdev)
> > > >    {
> > > > +	/*
> > > > +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> > > > +	 * watchdog device is not unregistered.
> > > > +	 */
> > > > +
> > > Odd explanation.
> > > I would assume that the smem device is supposed to be
> > > persistent as well.
> > Yes, but it's perfectly possible to run a modern Qualcomm device without
> > SMEM, with a fair amount of functionality. So, the reevaluation of this
> > decision is grinding in the back of my mind...
> 
> One option can be the SCM driver which was suggested by Neil in v3 [1].
> 
> Let us know if you have any suggestions where we can register the watchdog
> device?
> 

I think it makes more sense to tie it to the SCM driver, it's after all
related to the HVC-interface, which SMEM isn't.

But I don't think that answers our question of how do you determine if
Gunyah is there or not. Because qcom,scm-sc7280 is regardless of Linux
running under Gunyah, KVM, or directly in EL2.


I can't help feeling that this is a property of the hardware/firmware
interface that the OS finds itself in, which should be expressed in
DeviceTree - unless there's a bulletproof "Gunyah, are you there?"
check.

Regards,
Bjorn


> [1]:
> https://lore.kernel.org/lkml/321f5289-64c0-48f1-91b5-c45e82396ca9@linaro.org/
> 
> Thanks,
> 
> Hrishabh
> 

