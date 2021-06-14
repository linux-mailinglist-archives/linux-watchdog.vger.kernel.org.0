Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F843A6DCE
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jun 2021 19:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234450AbhFNR5q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Jun 2021 13:57:46 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55645 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbhFNR5q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Jun 2021 13:57:46 -0400
Received: from [192.168.1.155] ([95.115.71.85]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MeTkC-1lIQ7m0G9M-00aVfp; Mon, 14 Jun 2021 19:55:26 +0200
Subject: Re: [PATCH 2/3] watchdog: iTCO_wdt: use dev_*() instead of pr_*() for
 logging
To:     Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
References: <20201117152214.32244-2-info@metux.net>
 <20210609203229.GA2664456@bjorn-Precision-5520>
 <20210609235446.GA2542004@roeck-us.net>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3d4ea22d-a97c-b803-134c-751cb648f5f7@metux.net>
Date:   Mon, 14 Jun 2021 19:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210609235446.GA2542004@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KbXQG8znsYymTMdT/k0zlh/a7KWw8fPRszZ6ui2n3m/fRvzgR0U
 yY5N5WHs41GWE/dxFUgCTurmf/BvwZxtkm76s1Jo3NyTXnQA1nJBBq2FZx3CTC3k1i/CKOu
 nledMcKLmTyDEJAJeABbm/0LtUqXWc4v1EaLRKu7aP6peY6iTf1RnJKd+sOOCuYECFhJesl
 6dv2x8lf9PFK34IKUsp4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t1OqwrV1P3Q=:TX/IkJ79rlkIXYfBzBf81Q
 FmIjA+bx9TlEDjfnDdt9St5Y6KFHkdPJA12u6ll/y4cYZODqN4ifgcFNM/QivvA9FRGWdcx4U
 +USfWYN09Sdeiue5BDcrYPftB14jmDKJV4q/HyqiUiLM83CWUcnRYRAXxhfgqdjzfAllsxefG
 oeuwKvru3uQsbbnXtZDBg6EL+/xtwMcp+cKgDk1BK+Ww5XJhahfhy89GU7ppacK51iWRz8vHn
 egCpUj3/CJy/inyutILIG/+MSsLHWqTLvxHfTL1d0xQHay/qyMbsd1bgXkf4DK464DiaejoyV
 QrOSvaQRUx8j4V4r90EJqiv4NI4vCVCyqbXh+Gu6OEP1BuIzy2102cEug2A74aZWC4WgCpDVu
 o7cqLuLi+qVsr843JFyqf6SNF08g0xAURl0RjvuuhVNK60sn2nUulA/EMN5hREQfk15hVLTlH
 z4Cdy5xCmePx1QW8AFLZ1I8pDkQuNgE6zcTQJHEDlN7Hz6P5kk5AkN3LeDDGY9arZqXU29Mmb
 w3E60dtn9fjex4+LQv+2gk=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10.06.21 01:54, Guenter Roeck wrote:

> The above came in with a recent commit. I suspect they simply got lost,
> and they should be converted as well.

Since I might need to touch it again in near future, I'll do it in
one of the next rounds.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
