Return-Path: <linux-watchdog+bounces-262-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C980E27E
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 04:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3D0E1C216D2
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 03:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A8D524E;
	Tue, 12 Dec 2023 03:09:06 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F12B5;
	Mon, 11 Dec 2023 19:09:01 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1F7287FD3;
	Tue, 12 Dec 2023 11:09:00 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 11:09:00 +0800
Received: from [192.168.125.131] (183.27.97.57) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 11:08:59 +0800
Message-ID: <e7902994-4558-4f91-b8fe-a768961683b5@starfivetech.com>
Date: Tue, 12 Dec 2023 11:01:21 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] watchdog: starfive-wdt: Add JH8100 watchdog
 compatible string
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	<krzysztof.kozlowski@linaro.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <leyfoon.tan@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux@roeck-us.net>, <robh+dt@kernel.org>, <samin.guo@starfivetech.com>,
	<wim@linux-watchdog.org>
References: <84145eba-7877-4dc0-a221-2debb5a40d40@linaro.org>
 <20231211164700.1590908-1-jisheng.teoh@starfivetech.com>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20231211164700.1590908-1-jisheng.teoh@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag

On 2023/12/12 0:47, Ji Sheng Teoh wrote:
> On Mon, 11 Dec 2023 11:06:42 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 09/12/2023 15:27, Ji Sheng Teoh wrote:
>> > Add "starfive,jh8100-wdt" compatible for StarFive's JH8100 watchdog.
>> > JH8100 watchdog reuses JH7110 register mapping.
>> > 
>> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>> > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
>> > ---
>> >  drivers/watchdog/starfive-wdt.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> > 
>> > diff --git a/drivers/watchdog/starfive-wdt.c
>> > b/drivers/watchdog/starfive-wdt.c index 5f501b41faf9..31785bb373d5
>> > 100644 --- a/drivers/watchdog/starfive-wdt.c
>> > +++ b/drivers/watchdog/starfive-wdt.c
>> > @@ -581,6 +581,7 @@ static const struct dev_pm_ops
>> > starfive_wdt_pm_ops = { static const struct of_device_id
>> > starfive_wdt_match[] = { { .compatible = "starfive,jh7100-wdt",
>> > .data = &starfive_wdt_jh7100_variant }, { .compatible =
>> > "starfive,jh7110-wdt", .data = &starfive_wdt_jh7110_variant },
>> > +	{ .compatible = "starfive,jh8100-wdt", .data =
>> > &starfive_wdt_jh7110_variant },  
>> 
>> Device is compatible, so why not expressing it in the bindings and
>> dropping this change?
>> 
>> Best regards,
>> Krzysztof
>> 
> 
> Ok, will drop this change.
> 
> Thanks,
> Ji Sheng

Hi Ji Sheng,

You can add the compatible "starfive,jh8100-wdt" in the bindings and add this:

	compatible = "starfive,jh8100-wdt", "starfive,jh7110-wdt";

in the dts. I think it would be better and does not change the driver.

Best regards,
Xingyu Wu

