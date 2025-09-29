Return-Path: <linux-watchdog+bounces-4288-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010CBA8D94
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 12:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7455C189022A
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAEB2FB0B5;
	Mon, 29 Sep 2025 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MrJa+wmB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7BF1898F8;
	Mon, 29 Sep 2025 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141016; cv=none; b=WMsewjgT6KjGufN5gRZ5+x7eH3jhVhguEd03DcSLm8WmYPJlugkf4+tbES9zhuAUR242AX5W70Xem1RDks3L9QZ/Ve4FNBtb+43kKuJ1RrNL8O52Sj1xNd+WGQ7tSB4nuZnfaB4M76v0ReRoIC4IBFh932XXgYxwdxavj+yUh/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141016; c=relaxed/simple;
	bh=8UnAtFRpIMeOSkooXOzCCtQQlybpUNssjgKdWfSNXG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rQmeR1/1lPm2BXOZxTzTQnXQ9REYeQBnHaM7D809zjZHKbS525+25GpkINZHRj6DQSOhHE+iBKmDBHkeyHHOBq4sEVdilcsb13oB7uVzlCZkymbXJaKDbE6tQUVGeK/QF3pMqHCdoz/XBpuqm3HTJpp0b6F/qHC4VV2G/T+uOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MrJa+wmB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141012;
	bh=8UnAtFRpIMeOSkooXOzCCtQQlybpUNssjgKdWfSNXG0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MrJa+wmBqqiEmFpvmFRf3TUd4pqRwLynG2sCN9aFhlVWroTDdTmDDEGQDfPqO8cin
	 Oz8UDsHkMe5mBHYysK9vNwgV+pejSUSscONTPvRuKgbBpiL75sOp+pyhp8YO3KkmwV
	 p18r9EH0Cegq0E7D+RYCWGrvs0Lney/jbez53jZUh2WUnxGaHZRmCeoxPQx61UcU+I
	 ERx+s1gYBE38bXTrM3jsef5RdGWJt1oKm5ZClPRDjP6dFtg7t8NYctYuDY38KFqqf6
	 iTF7+Eov7CC99ZcpTzK9ZqryS6eeOZNPiDknjhxbqdDLHJ8BDh+9WU7dY6qBNmteeO
	 Jz1O8jxSYLHGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3AE17E0125;
	Mon, 29 Sep 2025 12:16:51 +0200 (CEST)
Message-ID: <de6d7300-acd4-4201-baf5-e7bb89eb5b1e@collabora.com>
Date: Mon, 29 Sep 2025 12:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: Add Airoha AN7583 SoC and AN7583
 Evaluation Board
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-5-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Introduce Airoha AN7583 SoC initial DTSI and AN7583 Evaluation Board
> DTS and add the required entry in the Makefile.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   arch/arm64/boot/dts/airoha/Makefile       |   1 +
>   arch/arm64/boot/dts/airoha/an7583-evb.dts |  22 ++
>   arch/arm64/boot/dts/airoha/an7583.dtsi    | 283 ++++++++++++++++++++++
>   3 files changed, 306 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
>   create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi
> 
> diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
> index ebea112ce1d7..7a604ae249b5 100644
> --- a/arch/arm64/boot/dts/airoha/Makefile
> +++ b/arch/arm64/boot/dts/airoha/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
> +dtb-$(CONFIG_ARCH_AIROHA) += an7583-evb.dtb

an comes before en.... please keep entries ordered alphabetically.

> diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/dts/airoha/an7583-evb.dts
> new file mode 100644
> index 000000000000..910ceaa6af42
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/dts-v1/;
> +
> +#include "an7583.dtsi"
> +
> +/ {
> +	model = "Airoha AN7583 Evaluation Board";
> +	compatible = "airoha,an7583-evb", "airoha,an7583";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x2 0x00000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts/airoha/an7583.dtsi
> new file mode 100644
> index 000000000000..77b8590e242b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	cpus {

..snip..

Sorry for not catching that in v2 - please move the PSCI node here, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



