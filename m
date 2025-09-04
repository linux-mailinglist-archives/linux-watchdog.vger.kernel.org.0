Return-Path: <linux-watchdog+bounces-4190-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6DB43DA1
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 15:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DF7A04B0E
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 13:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FD2306D4B;
	Thu,  4 Sep 2025 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctK/e8Pt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61052306487;
	Thu,  4 Sep 2025 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993643; cv=none; b=pEj0y+FaH9U3Cci+uOkPMMQPy8ZOkM5Id/gVK++Eqs689UPgtZxZaZiZzhoeEjFa1uN8kMFWSPDPZwfpruqq7I+vWA7K2UtqqcUlMEcB/UBXCEqb7VI7CEcsLv2FBssF3FMKgw37TEuMoH8e5iUkgSj0r077KlNSPVSR/xYFb/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993643; c=relaxed/simple;
	bh=7blmZ97WXY9p9+PpRhM/gO1SFlRb9oMTbXjX3kY/ujc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwZdsEGxgbcQzUEz5jJ88QOLkF7tLaHlQtkVYvPRBmjoPMZel1hf/n4G8x6pXk2mDnrJ+lD6Owi/m1uTomj2QypqFExEIk5fVmi34oPv8G9rm32FGQ/oUlgPbus1oR1qSSV6mYDfA4za7YcCDaNrhQsEC6T07ib9m01/ysJpq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctK/e8Pt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A3FC4CEF6;
	Thu,  4 Sep 2025 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756993641;
	bh=7blmZ97WXY9p9+PpRhM/gO1SFlRb9oMTbXjX3kY/ujc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctK/e8Pt8UVkju4PGLn9iUnUChPmaPfHXfFzI4AO7SqSEdxyBcnrMCyszyyFaoawu
	 EgDFj5EpkT7LZdnoFgEAa/Fi48haQnZZYeRco3hFCNZzav5xU5/JbfOU7s8t3mUe4q
	 3Ag5uofadH1n9RlY3ZbRgO9Bb6d/D218lqI9TCHLHbno9LQDNhV4QzUpMid4mxqdTf
	 CxXA4rsSG92FZOZZQ8hYRWkkxj0b4mqvUE/ZCSR5bKoyUhUMA9lpU8u9IhK+Y/w30T
	 ZsrSaDEAk7nGZzc3rbpRBGL27D3/1Nk8Xxto8DIJjk+ZCivhIC41yTLoPnZhjNxM88
	 OE3lUnQLT36aQ==
Date: Thu, 4 Sep 2025 08:47:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <ndwwddd7vzjpgvzg55whdno4ondfxvyg25p2jbdsvy4lmzsfyy@jnn3wywc7xtp>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
 <mfvuoslj27mbayypzr3wuagrq3p5wzelklgveedhwrxiaavwxy@7ipv2tup6oou>
 <7276d39b-a514-4265-a125-7e08f364f979@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7276d39b-a514-4265-a125-7e08f364f979@oss.qualcomm.com>

On Thu, Sep 04, 2025 at 05:10:33PM +0530, Hrishabh Rajput wrote:
> On 9/4/2025 1:43 AM, Bjorn Andersson wrote:
> > On Wed, Sep 03, 2025 at 07:34:00PM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
[..]
> > > +static int __init gunyah_wdt_init(void)
> > > +{
> > > +	return platform_driver_register(&gunyah_wdt_driver);
> > > +}
> > > +
> > > +module_init(gunyah_wdt_init);
> > module_platform_driver(gunyah_wdt_driver);
> 
> 
> This is intentional. I intend to keep this module persistent. No
> module_exit(gunyah_wdt_exit).
> 

I'm not sure I see the reason for doing so, but if that really is what
you meant, you should say so in the commit message or a comment -
otherwise someone will send a patch "fixing" it first thing tomorrow.

> > > +
> > > +MODULE_DESCRIPTION("Gunyah Watchdog Driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/include/linux/gunyah_errno.h b/include/linux/gunyah_errno.h
> > > new file mode 100644
> > > index 000000000000..518228e333bd
> > > --- /dev/null
> > > +++ b/include/linux/gunyah_errno.h
> > > @@ -0,0 +1,77 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + */
> > Isn't this content solely used from within gunyah_wdt.c? Why is it a
> > separate header file? Just move it into the c-file.
> > Regards,
> > Bjorn
> 
> 
> This header file is partially taken from [1] and I have only renamed it to
> gh_errno.h.

Let's not sprinkle include/linux/ with include files which might be
useful some day in the future. Put the information in the c-file and
when there is a second user (e.g. [1] is resubmitted) we can migrate it
to a include file at that time.

Thanks,
Bjorn

> 
> The error codes are not specific to watchdog and we have other drivers in
> the patch series [2] (which [1] is a part of) that would be using this.
> 
> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-3-1e9da6763d38@quicinc.com/
> 
> [2]
> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

