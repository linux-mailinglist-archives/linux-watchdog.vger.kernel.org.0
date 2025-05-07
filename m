Return-Path: <linux-watchdog+bounces-3441-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F7AAD32D
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 04:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FA831C034E0
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 02:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E954F70824;
	Wed,  7 May 2025 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Otzecflp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50EBA38;
	Wed,  7 May 2025 02:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746584267; cv=none; b=crnwIpdUx7C41lGf86ulM+wzfgNoCiFriOwGenOBSeQ/9P7joZeQUD0V47J6C6nTdbdYJ/hbM9qaN3OTUX8jhXYRyZ8Fm+GqfQ6FYLTHMWpcMo4LOp5i+qsRcW7J2NLjMKR7KHAHvejBOjuraduRABPwEuNM02ilVmJqwD/ZDCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746584267; c=relaxed/simple;
	bh=yEDtcuagXBE3WpNM9QEf7srqAr2BZBmw0w+sUPDns4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KemD5BYjdZXgqdegVNQCKknmZln/JkhkNbYjP5Zkr3y5DEv0I316u1SPKtXKm4FahpyB9Qd24l7CsFETgVLmnT91corxtpRc+jzk0aMDxZ/KJC+mQqpdAfuL/z3vjVI4lV0Lo6qG+OHodAdx+kYrRjqrpm4doQVuUyETa2Mq1zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Otzecflp; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 142d62da9;
	Wed, 7 May 2025 10:02:14 +0800 (GMT+08:00)
Message-ID: <a5da2a81-6944-4d4e-a582-a24f8340efc5@rock-chips.com>
Date: Wed, 7 May 2025 10:02:12 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] rockchip: Add rk3562 SoC and evb support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Yao Zi <ziyao@disroot.org>,
 Junhao Xie <bigfoot@classfun.cn>, devicetree@vger.kernel.org,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Jamie Iles <jamie@jamieiles.com>, Guenter Roeck <linux@roeck-us.net>,
 Frank Wang <frank.wang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Jimmy Hon <honyuenkwun@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <didi.debian@cknow.org>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Johan Jonker <jbx6244@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250506025715.33595-1-kever.yang@rock-chips.com>
 <174655575165.2171034.16453137338500014976.robh@kernel.org>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <174655575165.2171034.16453137338500014976.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHxhJVkhLTE5PS0IdSBlJTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lIQktDVUpLS1
	VKQlkG
X-HM-Tid: 0a96a87aadb103afkunm142d62da9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6Sxw*DjJLThVONSMKMjhL
	CzMaFDJVSlVKTE9NTkNISEhMT09OVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU5DSkw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=OtzecflpZnKWD8Lhk8YvqQFaFozPhpcL1pqbDiGpgC9A0ZDXFmuvh+VcYpV8dUal9T4xeNviwwGdxZ1idVC02A3wz5eHeYeDzO+YJ0vE5KOvgIsr+GLtwQRxbsc8LujSNLYBAJ2FeVNUIvCo8GcLng88Kqx8G+yVuzEPSt8FDv4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1zFclqcGuYPNryGvnI+na4Nb66ye8cJcL9CEUWPikAg=;
	h=date:mime-version:subject:message-id:from;


On 2025/5/7 02:23, Rob Herring (Arm) wrote:
> On Tue, 06 May 2025 10:57:09 +0800, Kever Yang wrote:
>> Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
>> scmi-shmem from soc node to reserved memory.
>>
>> Patch series V4 remove patches already landed, and remove dts nodes for
>> modules still under review.
>>
>> This patch set adds rk3562 SoC and its evb support.
>>
>> I have split out patches need driver change for different subsystem.
>> And all the modules with dt-binding document update in this patch set
>> do not need any driver change. I put them together to make it clear we
>> have a new SoC and board to use the new compatible. Please pick up the
>> patch for your subsystem, or please let me know if the patch has to
>> send separate.
>>
>> Test with USB, PCIe, EMMC, SD Card.
>>
>> This patch set is base on the patch set for rk3576 evb1 support.
>>
>> V3:
>> https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
>> V2:
>> https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/
>>
>>
>> Changes in v5:
>> - Collect review tag
>> - Update scmi-shmem from soc to reserved memory
>>
>> Changes in v4:
>> - Collect ack tag
>> - Collect ack tag
>> - Collect ack tag
>> - remove gmac and otp nodes
>> - remove gmac nodes
>>
>> Changes in v3:
>> - Collect reveiw tag
>> - Collect the Acked-by tag
>> - remove i2c/serial/spi alias
>> - add soc node
>>
>> Changes in v2:
>> - Update in sort order
>> - remove grf in cru
>> - Update some properties order
>>
>> Finley Xiao (2):
>>    arm64: dts: rockchip: add core dtsi for RK3562 Soc
>>    arm64: dts: rockchip: Add RK3562 evb2 devicetree
>>
>> Kever Yang (4):
>>    dt-bindings: watchdog: Add rk3562 compatible
>>    dt-bindings: rockchip: pmu: Add rk3562 compatible
>>    dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
>>    dt-bindings: arm: rockchip: Add rk3562 evb2 board
>>
>>   .../devicetree/bindings/arm/rockchip.yaml     |    5 +
>>   .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
>>   .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
>>   .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
>>   arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>>   .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  488 ++++
>>   .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
>>   arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1270 +++++++++
>>   8 files changed, 4126 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
>>
>> --
>> 2.25.1
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>    pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>   Base: attempting to guess base-commit...
>   Base: tags/next-20250506 (exact match)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250506025715.33595-1-kever.yang@rock-chips.com:
>
> arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/usb2-phy@ff740000: failed to match any schema with compatible: ['rockchip,rk3562-usb2phy']

The usb2-phy patch set[1] has send and got reviewed tag from Heiko for a 
long time, what should I do for that patch?


Thanks,
- Kever

[1] 
https://patchwork.kernel.org/project/linux-phy/patch/20250415050005.52773-2-kever.yang@rock-chips.com/

>
>
>
>
>
>

