Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C47E261093
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Jul 2019 13:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfGFLq4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 6 Jul 2019 07:46:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43480 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfGFLqz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 6 Jul 2019 07:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=j6y676QYR/iHJJ649Hu4pguKBc+26wcukAE46ESMMlo=; b=dOTYigO14yG8pQxnEPFBC19DX
        /Ww8mAJLwcfe1SJqp/NylfCiIiI9REBU4NBiWe4dYMw9xdQP6lV0y+pUltL/gztWxW7BxkiF1kRXE
        w6XA7g9pa5LjIsiEu0S8st2kB2gzhI15q6uEUzs4XQgoqkyabISla1WvfKEt7LUVcsysRFNZryzy2
        Vt4rLjvEjd+OfhIGQpJR1++ZVceLUOM/+IRXvzm2znfchAZwwCauZYISTmjywQAOsgIR2YmU3+vzt
        0KvSoXLLqm4bOXutzWmOhE1jpX4jFMrPYVTRcXNwmtfs/ro27ahj9vrDH17GltUK57PchaGmotAd6
        Zh3YctvFg==;
Received: from 177.205.70.5.dynamic.adsl.gvt.net.br ([177.205.70.5] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hjj9S-0002M7-Qh; Sat, 06 Jul 2019 11:46:47 +0000
Date:   Sat, 6 Jul 2019 08:46:38 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Dave Young <dyoung@redhat.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
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
Subject: Re: [PATCH 18/39] docs: admin-guide: add kdump documentation into
 it
Message-ID: <20190706084638.7dc875f2@coco.lan>
In-Reply-To: <20190705055904.GB2790@localhost.localdomain>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
        <654e7591c044632c06257e0f069a52c0bb993554.1561724493.git.mchehab+samsung@kernel.org>
        <6911b74c-848f-0060-3db5-b5d7e8061cb5@linux.alibaba.com>
        <20190705055904.GB2790@localhost.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Em Fri, 5 Jul 2019 13:59:04 +0800
Dave Young <dyoung@redhat.com> escreveu:

> On 07/05/19 at 11:43am, Alex Shi wrote:
> >=20
> >=20
> > =E5=9C=A8 2019/6/28 =E4=B8=8B=E5=8D=888:30, Mauro Carvalho Chehab =E5=
=86=99=E9=81=93: =20
> > > The Kdump documentation describes procedures with admins use
> > > in order to solve issues on their systems.
> > >=20
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > > ---
> > >  Documentation/admin-guide/bug-hunting.rst            | 4 ++--
> > >  Documentation/admin-guide/index.rst                  | 1 +
> > >  Documentation/{ =3D> admin-guide}/kdump/gdbmacros.txt  | 0
> > >  Documentation/{ =3D> admin-guide}/kdump/index.rst      | 1 -
> > >  Documentation/{ =3D> admin-guide}/kdump/kdump.rst      | 0
> > >  Documentation/{ =3D> admin-guide}/kdump/vmcoreinfo.rst | 0 =20
> >=20
> > I am not sure if it's convenience for people to have more levels in doc=
s.
> >=20
> > But I guess, move archs into a Documentation/arch/ dir should be fine. =
like Documentation/arch/{x86,arm,arm64,ia64,m68k,s390,powerpc,...} =20
>=20
> Alex, moving kdump to admin-guide sounds reasonable to me.  I also agree
> with you for those arch dependent files can be moved to
> Documentation/arch/, maybe you are talking about some other patches in
> the series for the arch/?=20

Alex,

It makes sense for me to have a Documentation/arch directory, and place
the arch-specific docs over there.

There's actually a technical advantage on doing that: Sphinx is dumb
with regards to PDF/LaTeX output: it requires all top documents to be
listed at Documentation/conf.py, under this var:

	latex_documents =3D [
		...
	]

As it creates one runtime Makefile at Documentation/output per listed
document there. So, the more we group such documents, the less merge
conflicts we'll have at Documentation/conf.py.

Btw, there's a [TECH TOPIC] proposal for KS/2019 meant to discuss=20
Documentation.

I suspect we could discuss the pros/cons of doing such change there.

My personal view is that we should keep the Documentation/ root dir as
clean as possible as a long term goal.

On the other hand, it makes the path bigger and harder to rename.

On a side note, last time we discussed documentation at KS I remember
I proposed to shortcut "Documentation/" to just "docs/". The consensus
on that time were to keep the big name. I still think that a shorter
one could help people to remind where documentation will be located.

Thanks,
Mauro
