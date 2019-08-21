Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833F79819C
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 19:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfHURma (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 13:42:30 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:32848 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727685AbfHURma (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 13:42:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id AFE4542ED1;
        Wed, 21 Aug 2019 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:in-reply-to:mime-version:user-agent
        :date:date:message-id:organization:from:from:references:subject
        :subject:received:received:received; s=mta-01; t=1566409346; x=
        1568223747; bh=xIeCTG9Uz22zsCzXQQcRPKCuWiLSlzzny3Ofg3KMqrM=; b=C
        ygUZYzxeNDDZsAd1Y8pjbWQRuQYz7lWpGDfdk66k25LEeLA9Z6B59XCjoyCbypzj
        0Dl+3fdP7w9iUNu+K5GUe/HrWfQY6spO1RBB7C8Ub2lL1bBtJgO73I2V3GNUAkTE
        nfRXgPfhuAMOv5bj/z7bIed7+oeYPxafC3Lj6Y3GFk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a46nstZX5FLF; Wed, 21 Aug 2019 20:42:26 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id AFA2D404CB;
        Wed, 21 Aug 2019 20:42:25 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 21
 Aug 2019 20:42:25 +0300
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
To:     Guenter Roeck <linux@roeck-us.net>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
From:   Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
Date:   Wed, 21 Aug 2019 20:42:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821163220.GA11547@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="Zcz065VrMDkDOXBxE02mg9C55JMy5xq8G"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--Zcz065VrMDkDOXBxE02mg9C55JMy5xq8G
Content-Type: multipart/mixed; boundary="SnUXFFWAI4JAXfpsQj9YgvBg6Fs71xEPL";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>, Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Message-ID: <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
In-Reply-To: <20190821163220.GA11547@roeck-us.net>

--SnUXFFWAI4JAXfpsQj9YgvBg6Fs71xEPL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

21.08.2019 19:32, Guenter Roeck wrote:
> On Wed, Aug 21, 2019 at 06:57:43PM +0300, Ivan Mikhaylov wrote:
>> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_S=
TATUS
>> to clear out boot code source and re-enable access to the primary SPI =
flash
>> chip while booted via wdt2 from the alternate chip.
>>
>> AST2400 datasheet says:
>> "In the 2nd flash booting mode, all the address mapping to CS0# would =
be
>> re-directed to CS1#. And CS0# is not accessable under this mode. To ac=
cess
>> CS0#, firmware should clear the 2nd boot mode register in the WDT2 sta=
tus
>> register WDT30.bit[1]."
> Is there reason to not do this automatically when loading the module
> in alt-boot mode ? What means does userspace have to determine if CS0
> or CS1 is active at any given time ? If there is reason to ever have CS=
1
> active instead of CS0, what means would userspace have to enable it ?

Yes, there is. The driver is loaded long before the filesystems are mount=
ed. The filesystems, in the event of alternate/recovery boot, need to be =
mounted from the same chip that the kernel was booted. For one reason bec=
ause the main chip at CS0 is most probably corrupt. If you clear that bit=
 when driver is loaded, your software will not know that and will try to =
mount the wrong filesystems. The whole idea of ASPEED's switching chipsel=
ects is to have identical firmware in both chips, without the need to pro=
cess the alternate boot state in any way except for indicating a successf=
ul boot and restoring access to CS0 when needed.

The userspace can read bootstatus sysfs node to determine if an alternate=
 boot has occured.

With ASPEED, CS1 is activated automatically by wdt2 when system fails to =
boot from the primary flash chip (at CS0) and disable the watchdog to ind=
icate a successful boot. When that happens, both CS0 and CS1 controls=C2=A0=
 get routed in hardware to CS1 line, making the primary flash chip inacce=
ssible. Depending on the architecture of the user-space software, it may =
choose to re-enable access to the primary chip via CS0 at different times=
=2E There must be a way to do so.

> If userspace can not really determine if CS1 or CS0 is active, all it c=
ould
> ever do was to enable CS0 to be in a deterministic state. If so, it doe=
sn't
> make sense to ever have CS1 active, and re-enabling CS0 could be automa=
tic.
>
> Similar, if CS1 can ever be enabled, there is no means for userspace to=
 ensure
> that some other application did not re-enable CS0 while it believes tha=
t CS1
> is enabled. If there is no means for userspace to enable CS1, it can ne=
ver be
> sure what is enabled (because some other entity may have enabled CS0 wh=
ile
> userspace just thought that CS1 is still enabled). Again, the only mean=
s
> to guarantee a well defined state would be to explicitly enable CS0 and=
 provive
> no means to enable CS1. Again, this could be done during boot, not requ=
iring
> an explicit request from userspace.

Please understand that activation of CS1 in place of CS0 is NOT a softwar=
e choice!


>> +	if (unlikely(!wdt))
>> +		return -ENODEV;
>> +
> How would this ever happen, and how / where is drvdata set to NULL ?

This is purely for robustness. Seeing a pointer obtained via a function a=
ccessed without first checking it for validity makes me nervous.

This code most probably adds nothing at the assembly level.

>
>> +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
>> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
>> +	wdt->wdd.bootstatus |=3D WDIOF_EXTERN1;
> The variable reflects the _boot status_. It should not change after boo=
ting.
Is there any documentation that dictates that? All I could find is

"bootstatus: status of the device after booting". That doesn't look to me=
 like it absolutely can not change to reflect the updated status (that is=
, to reflect that the originally set up alternate CS routing has been res=
et to normal).

If you absolutely disallow that, I think we could make 'access_cs0' reada=
ble instead, so it could report the current state of the boot code select=
ion bit. Reverted, I suppose. That way 'access_cs0' would report 1 after =
1 has been written to it (it wouldn't be possible to write a zero).

> @@ -223,6 +248,9 @@ static int aspeed_wdt_probe(struct platform_device =
*pdev)
> =20
>  	wdt->ctrl =3D WDT_CTRL_1MHZ_CLK;
> =20
> +	if (of_property_read_bool(np, "aspeed,alt-boot"))
> +		wdt->wdd.groups =3D bswitch_groups;
> +
> Why does this have to be separate to the existing evaluation of
> aspeed,alt-boot, and why does the existing code not work ?
>
> Also, is it guaranteed that this does not interfer with existing
> support for alt-boot ?

I think Ivan will comment on this.

With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
https://yadro.com



--SnUXFFWAI4JAXfpsQj9YgvBg6Fs71xEPL--

--Zcz065VrMDkDOXBxE02mg9C55JMy5xq8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdXYKAAAoJEOiTWHtbdBeNwLsP/0FvGr6UXRAiPRCYZ3wthrpT
PH3OT/GLRq1M/EFC13osP39HpoI2Vbk5jOeGBm1iw49bYTokTI14jgHrKJmXAlGB
A9XAw/KSnctu4JnLRkmx1xrPpjNjRTtzf1Ta5YZ6mzsnou0Qogcb2u9J1NnRqWsF
qWEo7GkIi4JHLRdgAVu4cm5RGaznUTyo2NiDqQQ/HAjnUx0CYhIGiR6Gv5QPYI+S
vGAnCLCu7XQQP1RUzO7CF+5nwQg0OL2SSKqTlkPTw2L5ZUhPAS73jX8xu+jPIRb8
ZCj8ccx0ErRsg/fodWBwVm3nVcCTHZ4Mo/JnmWIGZBotw8/+nA9jTMhOfoiUjbPP
tDEGQ+U1a+gQw4iTJl8d/OejCCXWXhlaolRd4vnhyVSNhVtKabJcLMROoI9/q530
W7md3BueFfdBcE0J3fWxbs5slfgoS0Jp36tG8hFphzjlXN82mAhjv9CSLVx5vONi
j7lJnHnpX1Z/XB4Dsd64UqoxHAOlGstfE3FkizZPGwq/WxDzYyJ6GBIfnmwqawX4
5SWuHwtID4SqSzMMBm66ypoy3t002sgX0EMIEvM8g2D9I7BKvufGjPtxCBr74+ux
ZlFdecol9jQodn56fSiTUCg00SIEo/UQ5MALUxKWXtqtBRMRRITwI8D4mNAS1sNB
TqGRTLoE/uBRq+aOGmla
=yA26
-----END PGP SIGNATURE-----

--Zcz065VrMDkDOXBxE02mg9C55JMy5xq8G--
