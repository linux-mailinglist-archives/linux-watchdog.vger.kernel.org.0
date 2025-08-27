Return-Path: <linux-watchdog+bounces-4072-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20058B3868F
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Aug 2025 17:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74F3175155
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Aug 2025 15:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5395E27B327;
	Wed, 27 Aug 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LYi7Pz3K"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C9278E7E;
	Wed, 27 Aug 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756308373; cv=none; b=r/VVqpBojWgo7r1NlkaQwvvL8jg1MZh2InklSqgMGqMU9XVleTUgOTOl7U2BonrfqLGz+OVVdMNThKvWntYWH2rZ79eNYLIlTbV01ThFAAUqwEdL0Ppu1LiDhOcxHTxgDRP82ReZhebJtFsHmnA/VvTag6QQWC0bZCW18iwMyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756308373; c=relaxed/simple;
	bh=i6Xvzh4Ujbr0eo99BolTbLSEmEh822Jw+vwhjVxzmbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NTv1+OFPEypWCrGIipwn88T6qDtMIVtse32F4D/9thoGfWSENRs3tJnaW2n85xL9caNqS9X0zQo39d0VGsjzZsjRFCiRzNTTC7pJ6+2dMZAL6vYwrZH0zpzuqufc0A/W0wqB9QZrl/+s1V7Hwvm0l7bBxqzoh0mwd6rjwjqOz5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LYi7Pz3K; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RDVZip1754713;
	Wed, 27 Aug 2025 08:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756301495;
	bh=IXQfCpyLup22AZJ23GsDzWhzY4Tz0dBOwxDytru+TlU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LYi7Pz3KO3rsoKBGHpGeJgHpgt7cxsR/LBeRXGbUd0cVflYWq9jQ++SJwlSFVMVnQ
	 8mIzCJ53CUSuLgyVW420CrksB6wINV6pMsHTWQn4GsaH+WtfFl4dF1taX5fukJBtzp
	 Hg+76XMv05LLoDjyubHceTWEcn1D4Aolw4s0QBJs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RDVZ9o2487461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 27 Aug 2025 08:31:35 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 08:31:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 08:31:34 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RDVYOw3153773;
	Wed, 27 Aug 2025 08:31:34 -0500
Message-ID: <992fcb80-1a54-4d57-a764-d6ba77cb11e9@ti.com>
Date: Wed, 27 Aug 2025 08:31:33 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] arm64: dts: ti: Add support for Kontron
 SMARC-sAM67
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla
	<srini@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-8-mwalle@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250822131531.1366437-8-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 8/22/25 8:15 AM, Michael Walle wrote:
> The Kontron SMARC-sAM67 is a SMARC module which features a TI AM67 SoC.
> It supports the following features:
>   * Quad-core AM67A94 with 1.4GHz
>   * 8 GiB RAM
>   * 64 GiB eMMC
>   * 4 MiB SPI flash for failsafe booting
>   * 4x UART
>   * 1x USB 2.0
>   * 1x USB 3.2 (or 4x USB3.2 with onboard USB 3.2 hub)
>   * 1x RTC
>   * 2x GBE
>   * 1x QSPI (with 2 chip selects)
>   * 1x SPI (with 2 chip selects)
>   * 7x I2C
>   * 4x CSI (*)
>   * 2x LVDS (or one dual-link LVDS)
>   * 1x DSI (*)
>   * 1x DP (*)
>   * onboard microcontroller for boot control, failsafe booting and
>     external watchdog
> 
> (*) not yet supported by the kernel
> 
> There is a base device tree and overlays which will add optional
> features. At the moment there is one full featured variant of that
> board whose device tree is generated during build by merging all the
> device tree overlays.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |    6 +
>   .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
>   .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
>   .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
>   4 files changed, 1141 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile

[...]

> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
> new file mode 100644
> index 000000000000..4e9eb7998f38
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
> @@ -0,0 +1,19 @@

DTSO files should have copyright and license here same as DTS.

Andrew

> +/dts-v1/;
> +/plugin/;
> +
> +&cpsw3g_mdio {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	phy1: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&cpsw_port2 {
> +	phy-connection-type = "rgmii-id";
> +	phy-handle = <&phy1>;
> +	nvmem-cells = <&base_mac_address 1>;
> +	nvmem-cell-names = "mac-address";
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> new file mode 100644
> index 000000000000..c9aa15269c92
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> @@ -0,0 +1,24 @@
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	aliases {
> +		rtc0 = "/bus@f0000/i2c@20000000/rtc@51"; /* &rtc */
> +		rtc1 = "/bus@f0000/bus@b00000/rtc@2b1f0000"; /* &wkup_rtc0 */
> +	};
> +};
> +
> +&main_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	rtc: rtc@51 {
> +		compatible = "microcrystal,rv8263";
> +		reg = <0x51>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtc_pins_default>;
> +		interrupts-extended = <&main_gpio0 36 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};


