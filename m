Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9D888150
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 19:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407374AbfHIRe5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 13:34:57 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56652 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406944AbfHIRe5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 13:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1565372095; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JBBXcOCe5jxgeJA9Ew7OF0NMI+cWO0Hl3MGAZrkCgPE=;
        b=BZmP9L6CMotO++meyoddPkVGWBcxQvNxh7gYS8Y4UEGk/XMSFRg1D3XzJA7G9831ktt00I
        wAUCLZGOI99DgSnvQn73n5HHPMZPD8WiVKqv45cVvnCznBkyTwtI1KT+LezaLOkLPR4xky
        BWDQ8VRCq5ko66QP14LTVAAJSeJznxQ=
Date:   Fri, 09 Aug 2019 19:34:49 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] watchdog: jz4740: Driver update
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1565372089.2091.4@crapouillou.net>
In-Reply-To: <20190809172906.GA21450@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
        <20190809165207.GA18104@roeck-us.net> <1565369726.2091.0@crapouillou.net>
        <20190809172906.GA21450@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



Le ven. 9 ao=FBt 2019 =E0 19:29, Guenter Roeck <linux@roeck-us.net> a=20
=E9crit :
> On Fri, Aug 09, 2019 at 06:55:26PM +0200, Paul Cercueil wrote:
>>  Hi Guenter,
>>=20
>>=20
>>  Le ven. 9 ao=FBt 2019 =E0 18:52, Guenter Roeck <linux@roeck-us.net> a=20
>> =E9crit :
>>  >On Fri, Aug 09, 2019 at 01:59:27PM +0200, Paul Cercueil wrote:
>>  >> Hi,
>>  >>
>>  >> This patchset comes from a bigger patchset that was cut in=20
>> smaller
>>  >> pieces for easier integration to mainline.
>>  >> (The patchset was https://lkml.org/lkml/2019/3/27/1837)
>>  >>
>>  >> The reviews were kept since the code mostly didn't change. The
>>  >>exception
>>  >> is the use of device_node_to_regmap() in patch 2/3. This=20
>> function was
>>  >> added in a prior patch, now merged in the MIPS tree.
>>  >>
>>  >> For that reason this patchset is based on the ingenic-tcu-v5.4=20
>> branch
>>  >>of
>>  >> the MIPS tree
>>  >> (git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git).
>>  >>
>>  >
>>  >What is the expectation here ? Should the series be sent upstream
>>  >through the watchdog tree, or through some other tree ?
>>=20
>>  You can get it through the watchdog tree if you merge the=20
>> ingenic-tcu-v5.4
>>  branch from the MIPS tree. If you'd rather not do that, I can get=20
>> it merged
>>  through the MIPS tree.
>>=20
> I would prefer a merge through the mips tree.
>=20
> Guenter

Ok; Can I get some signatures then? ;)

Thanks,
-Paul

=

