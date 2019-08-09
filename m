Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 223CB88095
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 18:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407486AbfHIQzd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 12:55:33 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51984 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407474AbfHIQzd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 12:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1565369731; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nWzZJ7V95tA47rviXrXOK6+pQvpYpvQ6lTk2mhfm/yw=;
        b=dw1kbzIlHKvx0KwHv6OP4aDBENKwJTdqF1oYqC5MVVXURaSaVPDMeI2l6PHw3ihe6oJOjK
        FZM0Ta5zn7nGeoyL2yHZ+aQJneaPv6lBzQHRKRBlIBJoScK9xtNne+AbwNFecZKrg9li1v
        K4cPp5tNFrT2B6Km0G44ZTOyIss/oGk=
Date:   Fri, 09 Aug 2019 18:55:26 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] watchdog: jz4740: Driver update
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1565369726.2091.0@crapouillou.net>
In-Reply-To: <20190809165207.GA18104@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
        <20190809165207.GA18104@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,


Le ven. 9 ao=FBt 2019 =E0 18:52, Guenter Roeck <linux@roeck-us.net> a=20
=E9crit :
> On Fri, Aug 09, 2019 at 01:59:27PM +0200, Paul Cercueil wrote:
>>  Hi,
>>=20
>>  This patchset comes from a bigger patchset that was cut in smaller
>>  pieces for easier integration to mainline.
>>  (The patchset was https://lkml.org/lkml/2019/3/27/1837)
>>=20
>>  The reviews were kept since the code mostly didn't change. The=20
>> exception
>>  is the use of device_node_to_regmap() in patch 2/3. This function=20
>> was
>>  added in a prior patch, now merged in the MIPS tree.
>>=20
>>  For that reason this patchset is based on the ingenic-tcu-v5.4=20
>> branch of
>>  the MIPS tree
>>  (git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git).
>>=20
>=20
> What is the expectation here ? Should the series be sent upstream
> through the watchdog tree, or through some other tree ?

You can get it through the watchdog tree if you merge the=20
ingenic-tcu-v5.4
branch from the MIPS tree. If you'd rather not do that, I can get it=20
merged
through the MIPS tree.

Thanks,
-Paul

=

