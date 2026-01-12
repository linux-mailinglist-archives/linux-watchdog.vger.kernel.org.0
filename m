Return-Path: <linux-watchdog+bounces-4794-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956AD10CF0
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 08:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C751A302ABAF
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 07:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F2E32252D;
	Mon, 12 Jan 2026 07:08:00 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89998313525;
	Mon, 12 Jan 2026 07:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201680; cv=none; b=ip0J+o1jQLEfDU8/ECb+L3AVrPHiJV470k7YPMBUvfeBBhSwg/7TgDbpdaYt+ufcV74lO7LlbWA3AkkqozjXFWvE7J0FBlopGz+R3Ar3ZlDOmzX9WcA280ohctwHSNLqOBSvfZnQfF/hmCUJJ0LS8Rja1Csl0oCS2DITiQmRJXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201680; c=relaxed/simple;
	bh=rLBjb640zyqA+ySpejEq1VoKjaB5jzwCyEhdh3AEdzI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKGDezOPrcpdURNpYQUi3mH2380PmCrK5LRkZ65JMW0Nd5e5Rge5O3Kij5l89dXSwSwZNJNBDHiU1NttZm28AdFzDcThuohJQ047MrxWmwloB+cSImq4qlSkwO6OwilQx5ZeWG+CjCWyMGidM5OQppHvwPXY20rS+1CUu2+EGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 60C75QC9070519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 12 Jan 2026 15:05:26 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Jan
 2026 15:05:26 +0800
Date: Mon, 12 Jan 2026 15:05:26 +0800
From: CL Wang <cl634@andestech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <tim609@andestech.com>,
        <cl634@andestech.com>, <ben717@andestech.com>
Subject: Re: [PATCH 2/3] watchdog: atcwdt200: Add driver for Andes ATCWDT200
Message-ID: <aWSdNkHc-MAR5CRr@swlinux02>
References: <20260107145058.213334-1-cl634@andestech.com>
 <20260107145058.213334-3-cl634@andestech.com>
 <f6499c9a-4ec8-4c9e-b9b5-e679e0f913a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6499c9a-4ec8-4c9e-b9b5-e679e0f913a4@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 60C75QC9070519

Hi Krzysztof,

Thanks for your review.

On 07/01/2026 15:50, Krzysztof Kozlowski wrote:

> Just use API for getting enabled clock.
Agreed. I will switch to using `devm_clk_get_enabled()` to simplify
the clock handling and error paths.

> No, read your binding. You said it is a list... list of phandles?
You are right. The property is intended to be a single uint32
configuration value. I will update the binding schema to clearly
define it as such and make it consistent with the driver.

> Just return.
Agreed. I will simplify the resume path and return directly on error.

> Drop, not needed.
Understood. I will drop the `"andestech,qilai-wdt"` compatible and keep
only the generic one.

> From where did you get this?
You're right, this is unnecessary. I will remove `.owner = THIS_MODULE`.

I will address all of the above in the next revision.

Best regards,
CL Wang

