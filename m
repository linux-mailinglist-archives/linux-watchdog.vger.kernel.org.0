Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B92336DEEF
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Apr 2021 20:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243314AbhD1S0M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Apr 2021 14:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239423AbhD1S0L (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Apr 2021 14:26:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF7BC061573;
        Wed, 28 Apr 2021 11:25:24 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h8so35324589edb.2;
        Wed, 28 Apr 2021 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HZtKi5yoYQn9ZEp2h4DNIGlsf0G15NT0grIid5syHwU=;
        b=u4e1UqU2VXiTOV9MU6XGgg+YWIg4dSG9H3Bh8GNEcBNY4m8k3FN/qiNRPD61+IuQtR
         fTFlreGV51dbtHf/NRZdnhrZM509Dsvr8e2ul5jOWtbiNHW/M6B/Wogq8xS3huU5xFd6
         sB4ol36QU6yeQNVzvCRFTAU2P2yp0McMtiqc+Rbnt4HIbrKcIwAkGMtJFTZlt/41+Jbg
         lcKH0bcwwhbtaZQ/xrcVblGIBTYdgX+yzbdKhm629VLO26fKusTpLTbi4byqoxSE5S7b
         FNwUxm1E7yPC9/gFLDNGbrJkadMqUKXv3Fx0qjv5T1rrMgKg24iGd0sJeooFY7k31pYl
         lyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HZtKi5yoYQn9ZEp2h4DNIGlsf0G15NT0grIid5syHwU=;
        b=oh/gBLG170IqcCdGKc3PIZmV2Xc0DtPfAAp926VG/6BQC+MWZyxIjFStPaaI9wA/Ia
         ui7n6CF+GugZJWQ64Bf/mQUpI4Kd6eXprV6yD6hFA2bZXKNo8Co7wZ26cUlnM77shyDI
         Nl+Y2iq0In+Rjp21aYq+sBHMabZjvW91qA4aTqWCV4rRt8/KCrUGdA+Z1G+aSkCd+WwQ
         RxQ1TG8t2UbP7mDN6xs8mi00uuPzyoOiPLACR/XTw435TuejdJ2x/QqAIO2VGLyO6fHm
         evkolwK9yF7kD8fjfj/w2pTvvD0L43jGz9ccfRsVo5QUVEy0K1M2hr4GeLkhL9gHFQ+j
         2elw==
X-Gm-Message-State: AOAM531uxCbA/is0s9YEEANFtEvB0nxmHcnUaEug9V3/0jVrc5eeY9jC
        SoYs7Vpu4fRvU1B1mH1ylUA=
X-Google-Smtp-Source: ABdhPJyHoP+NC7AdifFSxUK0bZYsJuOYuR4AmseNrjwmul/GtjSpHqP/oASKR/f+oAFr2F7/PtnIDg==
X-Received: by 2002:aa7:db14:: with SMTP id t20mr12823753eds.311.1619634323233;
        Wed, 28 Apr 2021 11:25:23 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id p24sm483439edt.5.2021.04.28.11.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 11:25:22 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] arm64: dts: rockchip: add core dtsi for RK3568
 SoC
To:     cl@rock-chips.com, heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
References: <20210428134759.22076-1-cl@rock-chips.com>
 <20210428135002.22528-1-cl@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <a6b9daab-c3db-15ba-2944-5cccf0434b08@gmail.com>
Date:   Wed, 28 Apr 2021 20:25:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428135002.22528-1-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Question for rob+dt or others.

===

1: Given error:

/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dt.yaml: sram@10f000:
sram@0:compatible: None of ['arm,scmi-shmem'] are valid under the given
schema
	From schema: /Documentation/devicetree/bindings/sram/sram.yaml

===
2: Given incorrect sram Example arm,scmi.txt that is in need to convert to
YAML:

sram@50000000 {
	compatible = "mmio-sram";
	reg = <0x0 0x50000000 0x0 0x10000>;

	#address-cells = <1>;
	#size-cells = <1>;
	ranges = <0 0x0 0x50000000 0x10000>;

	cpu_scp_lpri: scp-shmem@0 {
===
sram@0
===
		compatible = "arm,scmi-shmem";
		reg = <0x0 0x200>;
	};

	cpu_scp_hpri: scp-shmem@200 {
===
sram@200
===
		compatible = "arm,scmi-shmem";
		reg = <0x200 0x200>;
	};
};

===

Should "arm,scmi-shmem" also be added to sram.yaml ??
What to do with "arm,scmi.txt" then ??


patternProperties:
  "^([a-z]*-)?sram(-section)?@[a-f0-9]+$":
    type: object
    description:
      Each child of the sram node specifies a region of reserved memory.
    properties:
      compatible:
        description:
          Should contain a vendor specific string in the form
          <vendor>,[<device>-]<usage>
        contains:
          enum:
            - allwinner,sun4i-a10-sram-a3-a4
            - allwinner,sun4i-a10-sram-c1
            - allwinner,sun4i-a10-sram-d
            - allwinner,sun9i-a80-smp-sram
            - allwinner,sun50i-a64-sram-c
            - amlogic,meson8-ao-arc-sram
            - amlogic,meson8b-ao-arc-sram
            - amlogic,meson8-smp-sram
            - amlogic,meson8b-smp-sram
            - amlogic,meson-gxbb-scp-shmem
            - amlogic,meson-axg-scp-shmem
===
            - arm,scmi-shmem
===
            - renesas,smp-sram
            - rockchip,rk3066-smp-sram
            - samsung,exynos4210-sysram
            - samsung,exynos4210-sysram-ns
            - socionext,milbeaut-smp-sram

====

Given missing YAML documents for:

operating-points-v2
arm,pl330, arm,primecell
arm,scmi-smc
arm,scmi-shmem
rockchip,rk3568-pinctrl

For sort order and dtbs_check and for what's worth and fixed:

Reviewed-by: Johan Jonker <jbx6244@gmail.com>

On 4/28/21 3:50 PM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> RK3568 is a high-performance and low power quad-core application processor
> designed for personal mobile internet device and AIoT equipment. This patch
> add basic core dtsi file for it.
> 
> We use scmi_clk for cortex-a55 instead of standard ARMCLK, so that
> kernel/uboot/rtos can change cpu clk with the same code in ATF, and we will
> enalbe a special high-performance PLL when high frequency is required. The
> smci_clk code is in ATF, and clkid for cpu is 0, as below:
> 
>     cpu0: cpu@0 {
>         device_type = "cpu";
>         compatible = "arm,cortex-a55";
>         reg = <0x0 0x0>;
>         clocks = <&scmi_clk 0>;
>     };
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---

[..]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> new file mode 100644
> index 000000000000..7983fa13d93f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -0,0 +1,779 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/rk3568-cru.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,boot-mode.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	compatible = "rockchip,rk3568";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
> +		serial7 = &uart7;
> +		serial8 = &uart8;
> +		serial9 = &uart9;
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x0>;
> +			clocks = <&scmi_clk 0>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +		};
> +	};
> +
> +	cpu0_opp_table: cpu0-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <900000 900000 1150000>;
> +			clock-latency-ns = <40000>;
> +		};
> +
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <900000 900000 1150000>;
> +		};
> +
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <900000 900000 1150000>;
> +			opp-suspend;
> +		};
> +
> +		opp-1104000000 {
> +			opp-hz = /bits/ 64 <1104000000>;
> +			opp-microvolt = <900000 900000 1150000>;
> +		};
> +
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <900000 900000 1150000>;
> +		};
> +
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <975000 975000 1150000>;
> +		};
> +
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <1050000 1050000 1150000>;
> +		};
> +
> +		opp-1992000000 {
> +			opp-hz = /bits/ 64 <1992000000>;
> +			opp-microvolt = <1150000 1150000 1150000>;
> +		};
> +	};
> +
> +	firmware {
> +		scmi: scmi {
> +			compatible = "arm,scmi-smc";
> +			arm,smc-id = <0x82000010>;
> +			shmem = <&scmi_shmem>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +		};

> +

Remove empty line.

> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	xin24m: xin24m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	xin32k: xin32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "xin32k";
> +		pinctrl-0 = <&clk32k_out0>;
> +		pinctrl-names = "default";
> +		#clock-cells = <0>;
> +	};
> +
> +	sram@10f000 {
> +		compatible = "mmio-sram";
> +		reg = <0x0 0x0010f000 0x0 0x100>;

> +

Remove empty line.

> +		#address-cells = <1>;
> +		#size-cells = <1>;

> +		ranges = <0 0x0 0x0010f000 0x100>;

Is this correct ?

> +
> +		scmi_shmem: sram@0 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x100>;
> +		};
> +	};
> +
> +	gic: interrupt-controller@fd400000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0xfd400000 0 0x10000>, /* GICD */
> +		      <0x0 0xfd460000 0 0xc0000>; /* GICR */
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		mbi-alias = <0x0 0xfd400000>;
> +		mbi-ranges = <296 24>;
> +		msi-controller;
> +	};
> +
> +	pmugrf: syscon@fdc20000 {
> +		compatible = "rockchip,rk3568-pmugrf", "syscon", "simple-mfd";
> +		reg = <0x0 0xfdc20000 0x0 0x10000>;
> +	};
> +
> +	grf: syscon@fdc60000 {
> +		compatible = "rockchip,rk3568-grf", "syscon", "simple-mfd";
> +		reg = <0x0 0xfdc60000 0x0 0x10000>;
> +	};
> +
> +	pmucru: clock-controller@fdd00000 {
> +		compatible = "rockchip,rk3568-pmucru";
> +		reg = <0x0 0xfdd00000 0x0 0x1000>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +	};
> +
> +	cru: clock-controller@fdd20000 {
> +		compatible = "rockchip,rk3568-cru";
> +		reg = <0x0 0xfdd20000 0x0 0x1000>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +	};
> +
> +	i2c0: i2c@fdd40000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfdd40000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&pmucru CLK_I2C0>, <&pmucru PCLK_I2C0>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	uart0: serial@fdd50000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfdd50000 0x0 0x100>;
> +		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 0>, <&dmac0 1>;
> +		pinctrl-0 = <&uart0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	pwm0: pwm@fdd70000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70000 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm0m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm1: pwm@fdd70010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70010 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm1m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm2: pwm@fdd70020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70020 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm2m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm3: pwm@fdd70030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfdd70030 0x0 0x10>;
> +		clocks = <&pmucru CLK_PWM0>, <&pmucru PCLK_PWM0>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm3_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	sdmmc2: mmc@fe000000 {
> +		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x0 0xfe000000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC2>, <&cru CLK_SDMMC2>,
> +			 <&cru SCLK_SDMMC2_DRV>, <&cru SCLK_SDMMC2_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC2>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +
> +	sdmmc0: mmc@fe2b0000 {
> +		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x0 0xfe2b0000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC0>, <&cru CLK_SDMMC0>,
> +			 <&cru SCLK_SDMMC0_DRV>, <&cru SCLK_SDMMC0_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC0>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +
> +	sdmmc1: mmc@fe2c0000 {
> +		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x0 0xfe2c0000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC1>, <&cru CLK_SDMMC1>,
> +			 <&cru SCLK_SDMMC1_DRV>, <&cru SCLK_SDMMC1_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		resets = <&cru SRST_SDMMC1>;
> +		reset-names = "reset";
> +		status = "disabled";
> +	};
> +

> +	sdhci: mmc@fe310000 {

mmc@fe310000: rockchip,txclk-tapnum: missing size tag in [[8]]

From snps,dwcmshc-sdhci.yaml:

  rockchip,txclk-tapnum:
===
    maxItems: 1
    default: 8

Add default 8.
There's no maxItems specified in snps,dwcmshc-sdhci.yaml.
===
    description: Specify the number of delay for tx sampling.
    $ref: /schemas/types.yaml#/definitions/uint8
===

#define DLL_TXCLK_TAPNUM_DEFAULT	0x8


	if (of_property_read_u8(mmc_dev(host->mmc)->of_node,
"rockchip,txclk-tapnum",
				&priv->txclk_tapnum))

		priv->txclk_tapnum = DLL_TXCLK_TAPNUM_DEFAULT;
===

+&sdhci {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	non-removable;

+	rockchip,txclk-tapnum = <0x8>;

Remove.
Default is already 8.

+	status = "okay";
+};


> +		compatible = "rockchip,rk3568-dwcmshc";
> +		reg = <0x0 0xfe310000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +		assigned-clocks = <&cru BCLK_EMMC>, <&cru TCLK_EMMC>;
> +		assigned-clock-rates = <200000000>, <24000000>;
> +		clocks = <&cru CCLK_EMMC>, <&cru HCLK_EMMC>,
> +			 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
> +			 <&cru TCLK_EMMC>;
> +		clock-names = "core", "bus", "axi", "block", "timer";
> +		status = "disabled";
> +	};
> +
> +	dmac0: dmac@fe530000 {
> +		compatible = "arm,pl330", "arm,primecell";
> +		reg = <0x0 0xfe530000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,pl330-periph-burst;
> +		clocks = <&cru ACLK_BUS>;
> +		clock-names = "apb_pclk";
> +		#dma-cells = <1>;
> +	};
> +
> +	dmac1: dmac@fe550000 {
> +		compatible = "arm,pl330", "arm,primecell";
> +		reg = <0x0 0xfe550000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,pl330-periph-burst;
> +		clocks = <&cru ACLK_BUS>;
> +		clock-names = "apb_pclk";
> +		#dma-cells = <1>;
> +	};
> +
> +	i2c1: i2c@fe5a0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5a0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c1_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c2: i2c@fe5b0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5b0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c2m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c3: i2c@fe5c0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5c0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c3m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c4: i2c@fe5d0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5d0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c4m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	i2c5: i2c@fe5e0000 {
> +		compatible = "rockchip,rk3568-i2c", "rockchip,rk3399-i2c";
> +		reg = <0x0 0xfe5e0000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
> +		clock-names = "i2c", "pclk";
> +		pinctrl-0 = <&i2c5m0_xfer>;
> +		pinctrl-names = "default";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	wdt: watchdog@fe600000 {
> +		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
> +		reg = <0x0 0xfe600000 0x0 0x100>;
> +		interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
> +		clock-names = "tclk", "pclk";
> +	};
> +
> +	uart1: serial@fe650000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe650000 0x0 0x100>;
> +		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 2>, <&dmac0 3>;
> +		pinctrl-0 = <&uart1m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart2: serial@fe660000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe660000 0x0 0x100>;
> +		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 4>, <&dmac0 5>;
> +		pinctrl-0 = <&uart2m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart3: serial@fe670000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe670000 0x0 0x100>;
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 6>, <&dmac0 7>;
> +		pinctrl-0 = <&uart3m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart4: serial@fe680000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe680000 0x0 0x100>;
> +		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 8>, <&dmac0 9>;
> +		pinctrl-0 = <&uart4m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart5: serial@fe690000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe690000 0x0 0x100>;
> +		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 10>, <&dmac0 11>;
> +		pinctrl-0 = <&uart5m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart6: serial@fe6a0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6a0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 12>, <&dmac0 13>;
> +		pinctrl-0 = <&uart6m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart7: serial@fe6b0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6b0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 14>, <&dmac0 15>;
> +		pinctrl-0 = <&uart7m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart8: serial@fe6c0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6c0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 16>, <&dmac0 17>;
> +		pinctrl-0 = <&uart8m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	uart9: serial@fe6d0000 {
> +		compatible = "rockchip,rk3568-uart", "snps,dw-apb-uart";
> +		reg = <0x0 0xfe6d0000 0x0 0x100>;
> +		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
> +		clock-names = "baudclk", "apb_pclk";
> +		dmas = <&dmac0 18>, <&dmac0 19>;
> +		pinctrl-0 = <&uart9m0_xfer>;
> +		pinctrl-names = "default";
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +
> +	pwm4: pwm@fe6e0000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0000 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm4_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm5: pwm@fe6e0010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0010 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm5_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm6: pwm@fe6e0020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0020 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm6_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm7: pwm@fe6e0030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6e0030 0x0 0x10>;
> +		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm7_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm8: pwm@fe6f0000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0000 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm8m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm9: pwm@fe6f0010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0010 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm9m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm10: pwm@fe6f0020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0020 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm10m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm11: pwm@fe6f0030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe6f0030 0x0 0x10>;
> +		clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm11m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm12: pwm@fe700000 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700000 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm12m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm13: pwm@fe700010 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700010 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm13m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm14: pwm@fe700020 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700020 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm14m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pwm15: pwm@fe700030 {
> +		compatible = "rockchip,rk3568-pwm", "rockchip,rk3328-pwm";
> +		reg = <0x0 0xfe700030 0x0 0x10>;
> +		clocks = <&cru CLK_PWM3>, <&cru PCLK_PWM3>;
> +		clock-names = "pwm", "pclk";
> +		pinctrl-0 = <&pwm15m0_pins>;
> +		pinctrl-names = "active";
> +		#pwm-cells = <3>;
> +		status = "disabled";
> +	};
> +
> +	pinctrl: pinctrl {
> +		compatible = "rockchip,rk3568-pinctrl";
> +		rockchip,grf = <&grf>;
> +		rockchip,pmu = <&pmugrf>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +

> +		gpio0: gpio@fdd60000 {

For Heiko:
Driver must also change for this nodename.

> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfdd60000 0x0 0x100>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmucru PCLK_GPIO0>, <&pmucru DBCLK_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio1: gpio@fe740000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe740000 0x0 0x100>;
> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio2: gpio@fe750000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe750000 0x0 0x100>;
> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio3: gpio@fe760000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe760000 0x0 0x100>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio4: gpio@fe770000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x0 0xfe770000 0x0 0x100>;
> +			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +#include "rk3568-pinctrl.dtsi"
> 
