Return-Path: <linux-watchdog+bounces-4793-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FCCD10C69
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 08:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F035300EE67
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 07:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA5A325720;
	Mon, 12 Jan 2026 07:01:22 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3AE32570B;
	Mon, 12 Jan 2026 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201282; cv=none; b=hXSvK4rQ05Q3nwf7NKwPkdbhX6ftjvWPNQ1Qo8zAXbWFobt2qNc1hWj0HgRnRAP/K/0P0B2U+18xJC/zCpFnBTzbt1zaD3Rwz5cnKcNqUq1rdXJ9a3RlipowTVGdL8B/mbZ3L3GbrW5L8J1cuBwKL6mQLh+W993P2ITcVjmeEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201282; c=relaxed/simple;
	bh=hoLjnmQfmtoIbUhSFORBlU51TAZQvIPoEPV2v5T5xf8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0EdoKJCttdii1mED+uestA9lm1lVejl8hfeOoMfJ9ngRPMv3A+1UHR/HjXW+yjpIOO6No6ydjvUgVHje6dQICF59yCtqeWcYs+IuNJjy0338D1c62mF0mulMfgSjSsudrxhWnhsq//YxgIRSms9I3pCTPeEAmAzI9dJAPfoUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 60C6xBct068145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 12 Jan 2026 14:59:11 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Jan
 2026 14:59:11 +0800
Date: Mon, 12 Jan 2026 14:59:06 +0800
From: CL Wang <cl634@andestech.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <krzk+dt@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <tim609@andestech.com>, <linux-kernel@vger.kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Add support for Andes
 ATCWDT200
Message-ID: <aWSbun8D6fp8wsmK@swlinux02>
References: <20260107145058.213334-1-cl634@andestech.com>
 <20260107145058.213334-2-cl634@andestech.com>
 <176780298619.1372056.364291942804232671.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176780298619.1372056.364291942804232671.robh@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 60C6xBct068145

Hi Rob,

Thanks for the report.

You are right, the andestech,clock-source property is missing a type definition.
I will fix the schema, re-run make dt_binding_check with an up-to-date
dt-schema, and resend the patch.

Best regards,
CL Wang

