Return-Path: <linux-watchdog+bounces-4776-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CBD08452
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 10:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DDE8301AA9B
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 09:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312533590CF;
	Fri,  9 Jan 2026 09:38:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B9F3596ED;
	Fri,  9 Jan 2026 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951533; cv=none; b=raPkiQO8a6cpqOkO4t/2u400He+Xh2kBKtLiix9Fwtp/JR2iDW0rK+0yB3xAM7t8oE1uDRCpeYKPH3QHTwIJf5RB7IoMfKuXPFPo5WUf6y7w+f0aYgN5/v/j/N7Z30/uZSdHukRIzdw90qtFnqxRsEiexEU1JLVD+wEoKYxPMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951533; c=relaxed/simple;
	bh=qf0Ay49SUWNcpfPLtH9KOhfJ3qPKHVC59ZmhW095Oos=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np9Do0GRu8vElpFq5Y5bIga01sOWw9S4EgtgA7K/3c+N38TEPNHfYcRB6SrRKB/yPOhDcVzA8RnvKCGJ62fWhxUd4ja2cn6L2qjUYgfCTiVj46WTBNXLZMoG+oO9RLhQay4g3MNKpdxltbIzM5snZghtotwmAgQvPllnDRjkH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 6099a3IQ031860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 9 Jan 2026 17:36:03 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Jan
 2026 17:36:03 +0800
Date: Fri, 9 Jan 2026 17:35:58 +0800
From: CL Wang <cl634@andestech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <tim609@andestech.com>,
        <ben717@andestech.com>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Add support for Andes
 ATCWDT200
Message-ID: <aWDL_n16CLyP5DR3@swlinux02>
References: <20260107145058.213334-1-cl634@andestech.com>
 <20260107145058.213334-2-cl634@andestech.com>
 <ffb1a4ef-b22c-4d59-a494-0ab703ef24d2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ffb1a4ef-b22c-4d59-a494-0ab703ef24d2@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6099a3IQ031860

Hi Krzysztof,

Thanks for your review.

On 07/01/2026 15:50, Krzysztof Kozlowski wrote:
> Last part is redundant. Can you add a binding without supported properties and without usage examples?

Agreed. I will remove the redundant part "including supported properties
and usage examples" in the commit message in the next version.

> Subject says WDT200, this code sais 350 and qilai. What is what? You have entire commit msg to explain that

I will clarify in the commit message that ATCWDT200 is the IP name, which
is embedded in AndesCore-based platforms or SoCs such as AE350 and Qilai.

> No clue what's this, but for sure does not pass tests without description and type.

You are right, I missed the type definition. I will add the description
and set the type to uint32 (enum [0, 1]) for `andestech,clock-source`.

Best regards,
CL Wang

