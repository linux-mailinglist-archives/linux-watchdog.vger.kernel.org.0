Return-Path: <linux-watchdog+bounces-4191-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CACB43DC9
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 15:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A63D67A5849
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 13:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218762F3C3F;
	Thu,  4 Sep 2025 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmmetCR0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11012FC882;
	Thu,  4 Sep 2025 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993998; cv=none; b=r5c5pfVE8WLX/AvOwC86275HhrsdFOqd4SQ7mkXL0DTUoEpQEStKAG2bR4DToLMRG7vHX8JdynqNrGPz3cJLGQw5u/0dNgeSuZg4/Z4n0G2XjxXbVrpj4ILN0Mmm8Qmc6cHadPNdponWNF/sbydYr7rPotdgULI2z3zjK/FJhpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993998; c=relaxed/simple;
	bh=uOos5RCK838XZxaPCeWihHvrPLkipPebSmrQNTvBjUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8vazFrWR0SQZnW7Z16ukUSHGk08qBF3kqI2UYfMW9SKKPrSwzITX1huQM+41Zu9eZInxL0GDCqK2nUPMCA5aSs+GF07SjHnM12H1Pr0YEkQdMmHoCVVXHha/xOpp36m7YNnahDLuDQQxpkv7Ye0Q1j41Qa/K8mcihSyklJN1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmmetCR0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F629C4CEF1;
	Thu,  4 Sep 2025 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756993997;
	bh=uOos5RCK838XZxaPCeWihHvrPLkipPebSmrQNTvBjUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmmetCR0xcSvmfWa31P74Rurrq+iF+pBF+csmUjDb1Agv/lho2EemEzsQlUedwRw4
	 Sl9e+9xPRBOH9irwkpTr1KsHFaXoq1eBiDTivkCgY2YcKV8rmsdUEt0lOSNpuHa2+N
	 9Rzb29Yf5cYoBz9aXAqQ65c8VnPPjs3WuMy/NUYNvkV3YECC1xwPCDVSGACdV2UoyL
	 UaRRc8DHHYPd6FlgFKiakYznOS3WgjI/kSeIxZdJfn1d+FKARP0hGLMQjtIH514GsB
	 ZbkSKZVLWfu0Efc5gOP7XKQmtkXZWm1SIckAdcAjsKFxaswrXtNlHhQi2mk2ZxB7Bz
	 8o+UDms+hrqZA==
Date: Thu, 4 Sep 2025 08:53:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <qd22epqcu7sdza6jrl3tj7pceohqh3clsywv44uau5bvszux54@ajqseswmwf6x>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <a3af076b-ca0b-4d5e-8294-2bf5a9814959@linaro.org>
 <ec0dc13a-30f7-44a0-9a4a-5f44eccd3933@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec0dc13a-30f7-44a0-9a4a-5f44eccd3933@quicinc.com>

On Thu, Sep 04, 2025 at 02:48:03PM +0530, Pavan Kondeti wrote:
> On Thu, Sep 04, 2025 at 09:13:23AM +0200, Neil Armstrong wrote:
> > On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
> > > Gunyah is a Type-I hypervisor which was introduced in the patch series
> > > [1]. It is an open source hypervisor. The source repo is available at
> > > [2].
> > > 
> > > The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> > > access the MMIO watchdog. It either provides the fully emulated MMIO
> > > based watchdog interface or the SMC-based watchdog interface depending
> > > on the hypervisor configuration.
> > > The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> > > version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> > > 
> > > This patch series adds support for the SMC-based watchdog interface
> > > provided by the Gunyah Hypervisor. The driver supports start/stop
> > > operations, timeout and pretimeout configuration, pretimeout interrupt
> > > handling and system restart via watchdog.
> > > 
> > > This series is tested on SM8750 platform.
> > 
> > Would this driver work on older platforms like SM8550 & SM8650 ?
> > 
> 
> This driver should work on 8550 and 8650 too as long as the hypervisor
> overlay is applied to the device tree which happens in the bootloader.
> 

You have easy access to 8550 and 8650 MTP/QRD devices, please give us a
definitive answer.

Regards,
Bjorn

> I remember porting some hypercalls to 8550 upstream kernel to induce the
> watchdog bite in panic to collect the dumps. one of the biggest benefit
> w/ this driver is that we can collect dumps upon kernel panic. since we
> won't be able to pet the watchdog upon panic, the bite would eventually
> happens and device enters dump collection mode.
> 
> Thanks,
> Pavan

