Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E64439C43
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Jun 2019 11:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfFHJ5I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Jun 2019 05:57:08 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56056 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfFHJ5I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Jun 2019 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559987825; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IO8k7jeyiIdr3zv59ZQZDouOp0tCLQ64fYlPZZrzNHk=;
        b=F9nlhr+6wcW0Fes6Ur6203SFkh1wfrkvV8qyMSJKHiLQqEcuW42aTRGPWzbGBSGsg0syUE
        0m2v6v1na/QecA0u+dTw3kVXudnmg5+N9GAxdyg9r3GrtWolr0fy6zjPbUUF2rgTJJjct5
        +zDacUXICPjtmChxFR9030qOGwQHhJc=
Date:   Sat, 08 Jun 2019 11:57:01 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/4] watchdog: jz4740: Make probe function
 __init_or_module
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1559987821.1815.0@crapouillou.net>
In-Reply-To: <0dc0fd0a-54fc-5d70-af78-1874b5ece418@c-s.fr>
References: <20190607162429.17915-1-paul@crapouillou.net>
        <20190607162429.17915-5-paul@crapouillou.net>
        <0dc0fd0a-54fc-5d70-af78-1874b5ece418@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Christophe,

Le sam. 8 juin 2019 =E0 9:51, Christophe Leroy <christophe.leroy@c-s.fr>=20
a =E9crit :
> Hi Paul,
>=20
> Le 07/06/2019 =E0 18:24, Paul Cercueil a =E9crit :
>> This allows the probe function to be dropped after the kernel=20
>> finished
>> its initialization, in the case where the driver was not compiled as=20
>> a
>> module.
>=20
> I'm not sure that's what  __init_or_module flag does.
>=20
> As far as I understand, this flag makes the function being dropped=20
> only when the kernel is built without modules support, ie without=20
> CONFIG_MODULES. See=20
> https://elixir.bootlin.com/linux/latest/source/include/linux/module.h#L14=
5

So it doesn't depend on the driver being built-in or compiled as a=20
module?

> In addition, I'm not sure you can simply define a probe function as=20
> __init. What if someone tries to unbind and rebind the device through=20
> sysfs for instance ?

Ouch. I feel stupid now.

> It seems there is a special function called __platform_driver_probe()=20
> for registering devices when the probe function is to be in __init,=20
> see=20
> https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L6=
84

Yes, but only usable by drivers that won't defer probe, and it removes=20
the bind/unbind attributes from sysfs,
so it shouldn't be used for non-critical drivers, I think.

> Christophe
>=20
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>=20
>> Notes:
>>      v2: New patch
>>=20
>>   drivers/watchdog/jz4740_wdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/watchdog/jz4740_wdt.c=20
>> b/drivers/watchdog/jz4740_wdt.c
>> index 7519d80c5d05..2061788c1939 100644
>> --- a/drivers/watchdog/jz4740_wdt.c
>> +++ b/drivers/watchdog/jz4740_wdt.c
>> @@ -157,7 +157,7 @@ static const struct of_device_id=20
>> jz4740_wdt_of_matches[] =3D {
>>   MODULE_DEVICE_TABLE(of, jz4740_wdt_of_matches);
>>   #endif
>>   =7F-static int jz4740_wdt_probe(struct platform_device *pdev)
>> +static int __init_or_module jz4740_wdt_probe(struct platform_device=20
>> *pdev)
>>   {
>>   	struct device *dev =3D &pdev->dev;
>>   	struct jz4740_wdt_drvdata *drvdata;
>>=20

=

