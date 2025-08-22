Return-Path: <linux-watchdog+bounces-4046-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B7B31E7C
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 17:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FB6188A551
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EFE23D7C6;
	Fri, 22 Aug 2025 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TXKpmGyN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F27261B;
	Fri, 22 Aug 2025 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755876223; cv=none; b=mNedwDkFiu4R+gLGz3i1uxCUvLZ2Q+8DORixybiK6aVGjdByKrFDNMJcSWnJ/lPM+wT4USLK4R6NsKZJDRvsORV8ljHzfetpV8V2XtAArnUZPCQGo8R29yvPO2ApgcZC45HzC+lld7w1RHZnYljXTDb8aHxYwqtgqugE156uwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755876223; c=relaxed/simple;
	bh=dDiTso7F7LNgejI62OYKxYRMhrQZVDgAYSvotoCofXQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7UpjI7bQMyRzWcI6s3jVwWvLeVG2U2Vd5QV5NrhVTG6wjatvGdVpjDq2mJTzquWVE9cp+hRB1oI5TO/DQGRUpeyOcXODgwsQ0SX9YyxJh0cjbtRerhuZTWlKr4w1JMOKQA1LdQJndnYJC1c84AJxVhACYb1vYG69vyEyg0rX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TXKpmGyN; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MFNDLW754277;
	Fri, 22 Aug 2025 10:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755876193;
	bh=VBLghRpDnKN0bEo3TKQupICpm0Ote+xiP5+E9br8q0Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TXKpmGyNM/uEgtR/FgNT1eyTAgohzC8a0+t3WtH1M+Lonyf8qw4QaIwjX1sAcA+0n
	 DgdLthlfRL+3SOyGBP/GnTDuO05NUOTKNsG7bONu3Tir7cpqZO/eHIROJ5sKCW1GMQ
	 AWfqUHFzQ1ApqFB6aeZ2J7QhQDCCdYPzMAspzGV0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MFNDMG2793766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 10:23:13 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 10:23:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 10:23:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MFNDV33741978;
	Fri, 22 Aug 2025 10:23:13 -0500
Date: Fri, 22 Aug 2025 10:23:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla
	<srini@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Message-ID: <20250822152313.vjzjtzik2q5ek5kq@sadly>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:15-20250822, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
> 
> I'm aware that there is a patch [1] which moves the sl28cpld MFD
> schema to a different directory. Once that patch is merged, I'll
> repost this series. But I already want to get some early feedback.
> 
> [1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowski@linaro.org/
> 
> Michael Walle (7):
>   dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
>   dt-bindings: mfd: sl28cpld: add sa67mcu compatible
>   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
>   dt-bindings: watchdog: add SMARC-sAM67 support
>   dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
>   hwmon: sl28cpld: add SMARC-sAM67 support
>   arm64: dts: ti: Add support for Kontron SMARC-sAM67

Since this goes through multiple maintainers, may I suggest the
following strategy?

for this window:
* send dts and board binding changes dropping the nodes that are yet to
 be upstream
* send the compatible changes to each of the maintainers

Next window:
* add the nodes based on acceptance of the driver bindings

This removes multiple maintainers needing to give me immutable tags etc.

What do you think?
> 
>  .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
>  .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
>  .../bindings/mfd/kontron,sl28cpld.yaml        |    7 +-
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
>  .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
>  arch/arm64/boot/dts/ti/Makefile               |    6 +
>  .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
>  .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
>  .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
>  drivers/hwmon/sl28cpld-hwmon.c                |   76 +-
>  10 files changed, 1234 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> 
> -- 
> 2.39.5
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

