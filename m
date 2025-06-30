Return-Path: <linux-watchdog+bounces-3764-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E1AED5EF
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 09:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE927AA19C
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 07:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F12223715;
	Mon, 30 Jun 2025 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dTyzqLGs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A8221F1A;
	Mon, 30 Jun 2025 07:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269207; cv=none; b=cSKZ35ppbv+h6XO2hSAjEZYt+sqOLKs57COKEFJUNzz1fp0Mg25k0Ubd0nEGt/fJeS8oo6s8Z3RsAZJ3BPUlSeAL7vqceWP1pfIh2km4kX1cOWTtAGtkr3s8T+TNHcyHprPQAQn2yDinoowRCn/vVb8CAV+kb1UpH9GRScf0iJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269207; c=relaxed/simple;
	bh=v6IcimvUqsuVHvRdLPcpsC2EKecm3HZpeFUwlP6K4sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwnBZfOTKiMkHCy++YZ6iFQuXkE8sgzmROCBfijUJVkELK5WjTK15Jdb9OEL33f2WM9fz8tpURQ5pBwS8VfCne+DfInZipyKphfxj6rpo7J/rNEmV5JthExjPBbN0RRGXiYmxMAnzfih8IfUH3LKLr68fPNyLToXHW8eBUh2tLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dTyzqLGs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751269203;
	bh=v6IcimvUqsuVHvRdLPcpsC2EKecm3HZpeFUwlP6K4sQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dTyzqLGsVn0DnQHTwBQEs5oxtpykR3tEtnwoiIdWWf8XTiXNMwdhQYgaOkJGXSihR
	 UA5b+jxKoUW5gn+ZGGTuIARnXFv3jT7BzFAgTLIQgvOOctw3F27yh3pfMfmELEn49S
	 sVbF9uq77LjjNngUCi5JyYSXzmX+SY8JrZZETTo+1dKzMY56rvfBV2GfONMUuoEKbE
	 198BJ7ihPIoV5Rd8DWN3fHZ4ZXJAMxGmkzHR4xOr2vGordA/We74ERc0STAlyoOON/
	 Lc/a0ZXs19DZYsLOoECc6RHbFnoMAOLHeflHtFVaDczAkUWoWsC7luiLi8YiNmGBlp
	 1f4qmzhhySbFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FDF317E0342;
	Mon, 30 Jun 2025 09:40:02 +0200 (CEST)
Message-ID: <3fc71a09-8a09-4305-bd4d-3f157bb0ed3a@collabora.com>
Date: Mon, 30 Jun 2025 09:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-9-f7f842196986@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250626-mt6572-v2-9-f7f842196986@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 26/06/25 10:54, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add basic support for the MediaTek MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   arch/arm/boot/dts/mediatek/mt6572.dtsi | 109 +++++++++++++++++++++++++++++++++
>   1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..b4fa376619a58cacd33ef556f80c1a4f7126c4f5
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mediatek,mt6572";

Please, remove this compatible as it's anyway going to be overridden in all of the
board specific devicetrees; after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

