Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E12A888A09
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Aug 2019 10:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHJIhc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Aug 2019 04:37:32 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36913 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfHJIhb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Aug 2019 04:37:31 -0400
Received: by mail-qk1-f196.google.com with SMTP id s14so3099549qkm.4;
        Sat, 10 Aug 2019 01:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SfSLgCnqpc/WM1GqrvF/G7Golq4Tsd0KkkiO9gDWwfM=;
        b=I5+U5NtDrXSadrgTl0w6Xfwf7EVlKPEqGaH83D9EVzdZrV47tqTaxdGAI/PctgyWDj
         QsG2Xbpm8KKxSWjnyjiC3OY0+irYIiUBJeG7wjI158JDGPKSIDQS7+M1M3g6uAZrsen5
         ebrZGp0WKcoDHV3//schxebOETX84zyRevi4vMhdlF/7ZTXCpayHK9/nqB04OngDGOL6
         R0ow3S0YMy+9P2BFQXKgxidmqizTf1VN2hYTu/Azftwa1BvXsHe82bVxSSol05iTbxTK
         HUiSbgf5t+U/ddEQ6k6WQ8jUb2N+83cRNzwfgKj+3JsMBa8cBehClAsbLAtrWam41Zic
         c9HQ==
X-Gm-Message-State: APjAAAV+NUyjuPw5WQ42KgofF0MUndVjUmnVZF8CF6BJrUgwsz5+iVsh
        m/HsvlsSGQ0Bzgyvrps9cGs0pY5w8j4bT4BGDWc=
X-Google-Smtp-Source: APXvYqzhR32Ka29FgJwVblR/FtuBmLOPpfMS6RiFA0SBwglvDwGDijW6+Oln3ZpLuc+hkkW/5wgQ1CxsgweTfcOzQwI=
X-Received: by 2002:a37:984:: with SMTP id 126mr15919398qkj.3.1565426250665;
 Sat, 10 Aug 2019 01:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190809202749.742267-1-arnd@arndb.de> <20190809202749.742267-5-arnd@arndb.de>
 <20190809204227.GA19839@roeck-us.net>
In-Reply-To: <20190809204227.GA19839@roeck-us.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 10 Aug 2019 10:37:14 +0200
Message-ID: <CAK8P3a35Aa3-LKi+uWh5SJQpYKqd5VsTw6BhwTxwWW=Vh5B+Mw@mail.gmail.com>
Subject: Re: [PATCH 04/16] watchdog: remove ks8695 driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 9, 2019 at 10:42 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Aug 09, 2019 at 10:27:32PM +0200, Arnd Bergmann wrote:
> > The platform is getting removed, so there are no remaining
> > users of this driver.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> Please let me know if this should be applied through the watchdog tree.
> For now I'll assume it will be applied together with the rest of the
> series.

For this series, my preference is that you apply the patches through
the subsystem tree as there are no dependencies.

Thanks,

     Arnd
