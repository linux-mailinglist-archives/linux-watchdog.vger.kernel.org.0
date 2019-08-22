Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA27996DA
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Aug 2019 16:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731057AbfHVOg1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Aug 2019 10:36:27 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:60982 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729731AbfHVOg0 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Aug 2019 10:36:26 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 8A69942ED3;
        Thu, 22 Aug 2019 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:in-reply-to:mime-version:user-agent
        :date:date:message-id:organization:from:from:references:subject
        :subject:received:received:received; s=mta-01; t=1566484582; x=
        1568298983; bh=KjLZ/dXb03wCeLlcNpYc1sfR2QBhG4qiGXMw3VhDuCI=; b=h
        KIl6fK+ADBPFXUBs4nGI6DG4Ws8k+GDr1X5QqlQVHb9KjG9I2Yb9pq8Mz3cgp154
        EQiRcBGjakvt56n3c4qo54o3sJyWb/im+VOl0DtHktQxhVbkKAVhFat6vDGASqT6
        2kquwOsBC2X11clFMIzlQteIAbZ7Jv6qyaJOtPoX0Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qq5hMQ1PA2LM; Thu, 22 Aug 2019 17:36:22 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 8F97A412D3;
        Thu, 22 Aug 2019 17:36:22 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 22
 Aug 2019 17:36:22 +0300
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
 <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
 <20190821181008.GB15127@roeck-us.net>
From:   Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <5cb20f52-884a-b921-c904-ebf244092318@yadro.com>
Date:   Thu, 22 Aug 2019 17:36:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821181008.GB15127@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="YIEW7bBuQgeLRG8A8mPFaUjOFyaWm03jp"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--YIEW7bBuQgeLRG8A8mPFaUjOFyaWm03jp
Content-Type: multipart/mixed; boundary="CGCf03BkzPVvByrHDZk8giv8pTtRj2ooY";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Message-ID: <5cb20f52-884a-b921-c904-ebf244092318@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
 <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
 <20190821181008.GB15127@roeck-us.net>
In-Reply-To: <20190821181008.GB15127@roeck-us.net>

--CGCf03BkzPVvByrHDZk8giv8pTtRj2ooY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

21.08.2019 21:10, Guenter Roeck wrote:
> On Wed, Aug 21, 2019 at 08:42:24PM +0300, Alexander Amelkin wrote:
>> 21.08.2019 19:32, Guenter Roeck wrote:
>>> On Wed, Aug 21, 2019 at 06:57:43PM +0300, Ivan Mikhaylov wrote:
>>>> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT=
_STATUS
>>>> to clear out boot code source and re-enable access to the primary SP=
I flash
>>>> chip while booted via wdt2 from the alternate chip.
>>>>
>>>> AST2400 datasheet says:
>>>> "In the 2nd flash booting mode, all the address mapping to CS0# woul=
d be
>>>> re-directed to CS1#. And CS0# is not accessable under this mode. To =
access
>>>> CS0#, firmware should clear the 2nd boot mode register in the WDT2 s=
tatus
>>>> register WDT30.bit[1]."
>>> Is there reason to not do this automatically when loading the module
>>> in alt-boot mode ? What means does userspace have to determine if CS0=

>>> or CS1 is active at any given time ? If there is reason to ever have =
CS1
>>> active instead of CS0, what means would userspace have to enable it ?=

>> Yes, there is. The driver is loaded long before the filesystems are mo=
unted.
>> The filesystems, in the event of alternate/recovery boot, need to be m=
ounted
>> from the same chip that the kernel was booted. For one reason because =
the main
>> chip at CS0 is most probably corrupt. If you clear that bit when drive=
r is
>> loaded, your software will not know that and will try to mount the wro=
ng
>> filesystems. The whole idea of ASPEED's switching chipselects is to ha=
ve
>> identical firmware in both chips, without the need to process the alte=
rnate
>> boot state in any way except for indicating a successful boot and rest=
oring
>> access to CS0 when needed.
>>
>> The userspace can read bootstatus sysfs node to determine if an altern=
ate
>> boot has occured.
>>
>> With ASPEED, CS1 is activated automatically by wdt2 when system fails =
to boot
>> from the primary flash chip (at CS0) and disable the watchdog to indic=
ate a
>> successful boot. When that happens, both CS0 and CS1 controls=C2=A0 ge=
t routed in
>> hardware to CS1 line, making the primary flash chip inaccessible. Depe=
nding
>> on the architecture of the user-space software, it may choose to re-en=
able
>> access to the primary chip via CS0 at different times. There must be a=
 way to do so.
>>
> So by activating cs0, userspace would essentially pull its own root fil=
e system
> from underneath itself ?

Exactly. That's why for alternate boot the firmware would usually copy
all filesystems to memory and mount from there. Some embedded systems
do that always, regardless of which chip they boot from.

However, to be able to recover the main flash chip, the system needs CS0
to function as such (not as CS1). That's why this control is needed.

As Ivan mentioned, for AST2500 and the upcoming AST2600 the behavior
is slightly different. They don't just connect both CS controls to CS1 bu=
t instead
swap them so the primary chip becomes secondary from the software point
of view. The means to restore the normal wiring may still be needed.

>
>> This code most probably adds nothing at the assembly level.
>>
> That seems quite unlikely. Please demonstrate.

Yes, you were right. It adds 7 instructions. We'll drop the check.
It's just my DO-178 background, I add 'robustness' checks everywhere.

>>>> +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
>>>> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
>>>> +	wdt->wdd.bootstatus |=3D WDIOF_EXTERN1;
>>> The variable reflects the _boot status_. It should not change after b=
ooting.
>> Is there any documentation that dictates that? All I could find is
>>
>> "bootstatus: status of the device after booting". That doesn't look to=
 me like it absolutely can not change to reflect the updated status (that=
 is, to reflect that the originally set up alternate CS routing has been =
reset to normal).
>>
> You choose to interpret "after booting" in a kind of novel way,
> which I find a bit disturbing. I am not really sure how else to
> describe "boot status" in a way that does not permit such
> reinterpratation of the term.

How about "Reflects reasons that caused a reboot, remains constant until =
the next boot" ?

> On top of that, how specifically would "WDIOF_EXTERN1" reflect
> what you claim it does ? Not only you are hijacking bootstatus9
> (which is supposed to describe the reason for a reboot), you
> are also hijacking WDIOF_EXTERN1. That seems highly arbitrary
> to me, and is not really how an API/ABI should be used.

We used WDIOF_EXTERN1 because:

1. We thought that bootstatus _can_ change

2. We thought that adding extra bits wouldn't be appreciated

Now as you clarified that assumption 1 was wrong we are going to implemen=
t status as I proposed earlier:

>
>> I think we could make 'access_cs0' readable instead, so it could repor=
t the
>> current state of the boot code selection bit. Reverted, I suppose. Tha=
t
>> way 'access_cs0' would report 1 after 1 has been written to it (it wou=
ldn't
>> be possible to write a zero).

With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
https://yadro.com



--CGCf03BkzPVvByrHDZk8giv8pTtRj2ooY--

--YIEW7bBuQgeLRG8A8mPFaUjOFyaWm03jp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdXqhlAAoJEOiTWHtbdBeNGSMP/1EdyFby2fvhiS+viqTox7Yh
XBOSBOEbl1OohoMq87ZG6rhT5uuT+C+drxz+WIEP1wt2YgOS0gNO6ODsL9G9FZNf
PYns9R2pKHQ+5oMqP7FalU9EoCJiHdGK6/HrP/QERHTt4+lVNeJg+GrbaNOaIZew
qFsst9KCBmGxDJHv6j4sHExZBvsrP1P9+1q7LrJHP2ep3hWAKYcYlzsGooXtrFQH
oSNeQJxW9o3OXwMihIYoDLyfsUpazxTw8p/+t6EO4sopjP5Hh3LGbGskM1NdFVkc
sLFGBhX5qmMxRQhBHyIdCJz9c0D6uhTp5MfcllQf7+FVo+0QLo8WVSxGLUoP4TH5
BttQvU+7H7DCRu5WxBj00LhPS2wK1Xb2KJ1agoo7QSr/5RpNqyFRGKIykQmWNm/X
TJ/Ru3IMUQl8HC2C3ihddw7CRm5js2X0n45HI+7BjqkO5e+yW7he/nIRDgm19udU
ChkkjqMKRUAC4aOQWxDMEC20PMjsi+3r0eiF5BCgQJ6qIzlzU18V6JHCiaCGENr0
um1OktmfkT5SPqDJgDw0QX/7e/jIJD0mA5HZgKVQmtTPJEUN+YyHSWvseJKdyR6S
4/4udiV8wCHdXIgjgSAxcCrRKqX9zfjurOZUA0LneS3a88jfP2D5GLBV51+wIB1I
xf+LRRJj90D2ov79r4dD
=nMHV
-----END PGP SIGNATURE-----

--YIEW7bBuQgeLRG8A8mPFaUjOFyaWm03jp--
