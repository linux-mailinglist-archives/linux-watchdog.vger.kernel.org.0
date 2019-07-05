Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABFE600BB
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2019 07:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfGEF7T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jul 2019 01:59:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55298 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfGEF7T (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jul 2019 01:59:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BE7D813A98;
        Fri,  5 Jul 2019 05:59:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-83.pek2.redhat.com [10.72.12.83])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 073FB60BF1;
        Fri,  5 Jul 2019 05:59:07 +0000 (UTC)
Date:   Fri, 5 Jul 2019 13:59:04 +0800
From:   Dave Young <dyoung@redhat.com>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Harry Wei <harryxiyou@gmail.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 18/39] docs: admin-guide: add kdump documentation into it
Message-ID: <20190705055904.GB2790@localhost.localdomain>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
 <654e7591c044632c06257e0f069a52c0bb993554.1561724493.git.mchehab+samsung@kernel.org>
 <6911b74c-848f-0060-3db5-b5d7e8061cb5@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6911b74c-848f-0060-3db5-b5d7e8061cb5@linux.alibaba.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 05 Jul 2019 05:59:18 +0000 (UTC)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07/05/19 at 11:43am, Alex Shi wrote:
> 
> 
> 在 2019/6/28 下午8:30, Mauro Carvalho Chehab 写道:
> > The Kdump documentation describes procedures with admins use
> > in order to solve issues on their systems.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/admin-guide/bug-hunting.rst            | 4 ++--
> >  Documentation/admin-guide/index.rst                  | 1 +
> >  Documentation/{ => admin-guide}/kdump/gdbmacros.txt  | 0
> >  Documentation/{ => admin-guide}/kdump/index.rst      | 1 -
> >  Documentation/{ => admin-guide}/kdump/kdump.rst      | 0
> >  Documentation/{ => admin-guide}/kdump/vmcoreinfo.rst | 0
> 
> I am not sure if it's convenience for people to have more levels in docs.
> 
> But I guess, move archs into a Documentation/arch/ dir should be fine. like Documentation/arch/{x86,arm,arm64,ia64,m68k,s390,powerpc,...}

Alex, moving kdump to admin-guide sounds reasonable to me.  I also agree
with you for those arch dependent files can be moved to
Documentation/arch/, maybe you are talking about some other patches in
the series for the arch/? 

Thanks
dave
