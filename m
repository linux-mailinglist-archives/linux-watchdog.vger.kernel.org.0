Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1D532D09B
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 11:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238452AbhCDKVv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 05:21:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238456AbhCDKVT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 05:21:19 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F180FC061574;
        Thu,  4 Mar 2021 02:20:38 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id e6so18604455pgk.5;
        Thu, 04 Mar 2021 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2sBIfTn7n2ac+dVLLLD+L/1zPiTc9MqRXox5AuQ7ds=;
        b=d2tpRGdQX2cYt+tHNwBXvDE/BkgROLsB+AOedlPNG5LnoUZOJCj75JnDaPrDO1wes3
         EGm+4tAOk08ubQaUkdzIQJJwe+aCfp93wOGG4CWiD1UjC/rkHtYTb8jVoLOgvSmB07Su
         dKylz1t5QklWGLBIKA8UDP8ik4EK2OGgkpVjzsARUazR9AitlTkG+wXaP/EvBZwqqnyC
         X27PN63Z7Xrhy8MHnLmRi+qhNx+zAB42BCKPkZrgHsNryn4hPCnqxCqyMVLTl910Wuhc
         I5eFv1XODZPGQkFPKhx46FdriOzVq5OhEyCpfrshHf+Jo/WugWepAAK9xJJ9OcFvwS9p
         6+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2sBIfTn7n2ac+dVLLLD+L/1zPiTc9MqRXox5AuQ7ds=;
        b=fzXNJu2G9Q+yJ42U3iQdEMXjTC7EPCXGZS2kmjYxrez8QJsa+VEbquCNBH0k6Wzhii
         e8drtjMuuAJ5+tivw7gGORv9iIXMiTAibvvycaJZVrPl5fJRJGC+MsXoZIffOxhr/itK
         Zszb6zOtB//h6CAphZ+Yk0FOs0jMtWgOlSbsPVymTy5A+SwgAQXm2QnYc+Q/sSbk72P2
         u5wyJw6Zcx5Nrcio3TNZMGt0SsW8ThlLa1Gvzr2ZpIqM2Uyfq9KJwAwTysxBSzZApm/d
         6C05R0A7N4cfGWA+MQ/6E/rrrriEhM49nKvIOXV+sx2wL7vlagssaWKClz/PIjfRH3D8
         9k2g==
X-Gm-Message-State: AOAM532QRQu7T1OfgYgNzk2QIuPoLzSiFRxfoyM3MUCKI2MhZtjyoBCN
        ZYM1udmNEF20rK31V+7u1g3xJDDtCigrpYD5qHc=
X-Google-Smtp-Source: ABdhPJzF7BaqOUfbPHU76hTVzOk3ag+MgAjkzF9Id3rudYRq8r3ioNQUaYQRWCIBIDHeMni6oWq1mU0EZb+Hh9pcbas=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr3193399pgf.4.1614853238515;
 Thu, 04 Mar 2021 02:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com> <CAHp75VeYN_q0OVoTGQ5fe-08exfGgpM3-ohG8iF4D8B_fKar=g@mail.gmail.com>
In-Reply-To: <CAHp75VeYN_q0OVoTGQ5fe-08exfGgpM3-ohG8iF4D8B_fKar=g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:20:22 +0200
Message-ID: <CAHp75VfBhMHUxM_CnGRTZuYg19cRpEKuyZ284hMg=MZpinnX_w@mail.gmail.com>
Subject: Re: [PATCH 0/4] add device drivers for Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 4, 2021 at 12:19 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Mar 4, 2021 at 9:29 AM Henning Schild
> <henning.schild@siemens.com> wrote:

> I have given a few comments here and there, so please check the entire
> series and address them in _all_ similar locations. As I have noticed,
> I have different approach about P2SB code, I have to give the series a
> dust and see if you can utilize it.
>
> I would like to be Cc'ed on the next version.

One more thing, is it Apollo Lake based?

-- 
With Best Regards,
Andy Shevchenko
