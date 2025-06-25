Return-Path: <linux-watchdog+bounces-3715-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE217AE7634
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 06:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 214233A5C11
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 04:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48D01D432D;
	Wed, 25 Jun 2025 04:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aVnTZh+G"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F035280;
	Wed, 25 Jun 2025 04:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827253; cv=none; b=rk65lLH37A9DodROpjiZ4yfd4HFNlRsc9Wt90MpJ6uzrxCKMBRIiz6ijt0A4Is5zS9xI+dq0mAE1TX9rfvRwAgRdq9woeT/yuvFp8ZgjhngGuhkzymtGMM2r5VgR/0vmhrxA5S3wOgS4X+b8dRj0/GOovzcMqw+CjEyPJFBOa0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827253; c=relaxed/simple;
	bh=T4oMS/UYHhH2kSrrHCVM15xoOnQaU/C+jWcr+Vc0gwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jd3vReB0y7T+F5SLLja2c6UJBdkQE0vhqfLr5+JgUdHFJ+3RUXq4dCj2NAz5fK/aBCTP0w8W2wK6FpPZVVAB+FdwI/tz+5wXWeWRJ7VTOBKnrJx79Yn8Kb+Ty/nydSGakmTgdaUbDwYV0sCYgrPAptWKcQn9W/bCQmzTbO/Ux20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aVnTZh+G; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55P4rstu2040833;
	Tue, 24 Jun 2025 23:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750827234;
	bh=b3no2NG3xR2a4DyD5qkF1Cq3m2ljBEdtB02js9lWzpw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aVnTZh+Ga6t6mDrInar6pb/lpqQtkW2FDxI30dmIQgzq0CMel0xhRgpvcEeXRseEc
	 V9g8H0Se/hBSGVOUagSf9EsS7D9iQd9jNeh6dMyJOw75Qflko2vGBxF5VTDOIMsNvW
	 vfAVYyoI8cyFvH+PiKR5vWpt/4iuoSxEq56bIZoA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55P4rsk9928730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 23:53:54 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 23:53:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 23:53:53 -0500
Received: from [10.249.142.58] ([10.249.142.58])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55P4rn5G2993802;
	Tue, 24 Jun 2025 23:53:50 -0500
Message-ID: <4b91a211-9e97-4431-8b42-4817fd17e1e1@ti.com>
Date: Wed, 25 Jun 2025 10:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RESEND 1/2] dt-bindings: watchdog: ti,rti-wdt: Add
 ti,am62l-rti-wdt compatible
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250624202605.1333645-1-jm@ti.com>
 <20250624202605.1333645-2-jm@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250624202605.1333645-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 6/25/2025 1:56 AM, Judith Mendez wrote:
> Add a new compatible ti,am62l-rti-wdt for am62l SoC [0].
> 
> [0] https://www.ti.com/product/AM62L
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> index 62ddc284a524..f57d5c2b8024 100644
> --- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      enum:
>        - ti,j7-rti-wdt
> +      - ti,am62l-rti-wdt
>  

Would be good to keep this sorted alphabetically.

>    reg:
>      maxItems: 1


