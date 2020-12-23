Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36BB2E2082
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Dec 2020 19:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgLWSj0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Dec 2020 13:39:26 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:41410 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgLWSj0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Dec 2020 13:39:26 -0500
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 28BB140934; Wed, 23 Dec 2020 18:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 28BB140934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1608744695;
        bh=dhTdCT4pN5VMQkKtMd4VeCNbKGXEpje8KEf5ClHXk8o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SEMZ4PQyXqJi7my/XBFznaqAlsrtu/FXyGNkVknCrf/JR8Ye4KDTu3zmdYvlBUtSJ
         zYoXlq25KtAtwxuIsPnL7iuD3OaWjUjQc7pDymGXHbj+RmDjdG9FRhytnSJRRRwy/O
         u/RIp8cjphRMgFW1hczNLE3gnVhjQrvEYrgfT7Uk=
Date:   Wed, 23 Dec 2020 18:31:35 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Etienne Carriere <etienne.carriere@st.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Robert Marko <robert.marko@sartura.hr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tom Rix <trix@redhat.com>,
        Wang Wensheng <wangwensheng4@huawei.com>,
        Wong Vee Khee <vee.khee.wong@intel.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Zhao Qiang <qiang.zhao@nxp.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v5.11 Merge window
Message-ID: <20201223173134.GA23404@www.linux-watchdog.org>
References: <20201222163452.GA1524@www.linux-watchdog.org>
 <CAHk-=wjEHYdDMwUqy0LqWMvAOqkce6Dj6Q5dkUpJOdd01sVhdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjEHYdDMwUqy0LqWMvAOqkce6Dj6Q5dkUpJOdd01sVhdw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

> >
> >   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-5.11-rc1
> 
> There's no such tag there. Forgot to push out?
> 
> I can see the the top-of-tree has the SHA1 that you mention:
> 
> > for you to fetch changes up to 0b9491b621196a5d7f163dde81d98e0687bdba97:
> 
> but the tag itself is missing. And outside of kernel.org, I do require
> signed tags (and even on kernel.org I very strongly prefer them), so I
> won't just pull that HEAD branch.

I know you require the tag and I did create it. So I checked what went wrong and stupid me: i created it in the wrong repository :-( .
So it was indeed not there...

Anyway, I created it in the correct repostitory now. You should be able to fetch it correctly now.

Forgive my stupidity...

Kind regards and Happy Christmas,
Wim.

