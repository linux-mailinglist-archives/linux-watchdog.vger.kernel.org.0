Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC2DF3609
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2019 18:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbfKGRqq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Nov 2019 12:46:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33170 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfKGRqq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Nov 2019 12:46:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id t5so3273589ljk.0
        for <linux-watchdog@vger.kernel.org>; Thu, 07 Nov 2019 09:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgEsxkXbthlwNlcTVEJRQP6HEHU+G6G0b7v65JSaIv0=;
        b=IO4rDCgRnLQTJIrUIaG348TrMf54C0MdBt2UuWA2x09K5pxot0CuTfc4+Gct8jNctQ
         j9GoVtZV6Hq0U1aHkDlfe4t3uomtxHpqdxJfabrLxAcK92TcjotX+J8h+yB9/oMzHx7N
         i9MaJidVviEI/1HKXvg8Jd/JYgKFJwEIj9xP25I65AB1Rq37YQEXJW+FNCBCzAOxGEV+
         EY7pu6/JUMBp/gLHft7Dbf4UVRPJc3SYJGocJuNuloqRbbiOVo1h1M7yb/jIoFt77qcy
         fEgyK1Yl5BX+bbwX7abTz13i+l8rw7O7NFHRCtkizXHpt3H/NDUhKoUcx8p5R2pq1tJt
         8laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgEsxkXbthlwNlcTVEJRQP6HEHU+G6G0b7v65JSaIv0=;
        b=Ggkpx24A2DCdMc1lPV+C7l72ceN3c6oaBRJO1EY2g4k1VMEJEb8xVf7Zo3Ew5bdsbT
         Le/ImA9cXWUe2AbNxvQJNhOptjGsM4hHHWPv2N/zzw/QJIZxAmrhJgwvJY5h0ECfWlzF
         oupaoSt4PuuUvAEXdg9slvjzR3rmzbXotnuQPNf3teq6+jiniKRFGRWDgdVtAuDwIL7G
         H69aqvg93iMYHvphl20VpxlkXCDwNhLhTtmmxVOo1ceb2nNhWg+svPLWTfroa2PHvh+n
         ctUh+FiaDzyS2GjuA6jaol+ZrfmvMpKKyqF+x8FzFukHzOqKF5TrzfdyLGYF6vxTs2Pu
         DwcQ==
X-Gm-Message-State: APjAAAUYt3EMvepsdO1tMvxEsGz3T/Y5yF0GUz6WVUd+bX1lHjU82n4v
        kYdUFQVCM5n8i6955dYhqx4WnAkS3/XkeZUtB2g=
X-Google-Smtp-Source: APXvYqzj3j/MrUxF+xFoVFgMOpexHAOHcUjtpP8oIFpHnUgdkLbt5A4JkUZRS0zB26a79hDZhX/vM47Gxurceh7xgCs=
X-Received: by 2002:a2e:8e97:: with SMTP id z23mr3236461ljk.149.1573148804219;
 Thu, 07 Nov 2019 09:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20191029174037.25381-1-festevam@gmail.com> <20191102153631.GA5514@roeck-us.net>
 <CAOMZO5AvCHo6pOfX32Bz-r8AjmbuqFWc5YUho9S1Gz8Tdo2SBA@mail.gmail.com> <69c3f4b9-6ca5-f44d-0ebc-d6fac368ec45@roeck-us.net>
In-Reply-To: <69c3f4b9-6ca5-f44d-0ebc-d6fac368ec45@roeck-us.net>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 7 Nov 2019 14:46:35 -0300
Message-ID: <CAOMZO5D=7U0tbAgbx2si1f0Q7BwfZDcUb-8uJ6TBNDZDZ0K+Eg@mail.gmail.com>
Subject: Re: [PATCH 1/5] watchdog: imx7ulp: Fix reboot hang
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Yongcai Huang <Anson.Huang@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Mon, Nov 4, 2019 at 11:06 AM Guenter Roeck <linux@roeck-us.net> wrote:

> Maybe I should have said "there is no call to watchdog_set_restart_priority()".

Would you like me to respin this series with a call to
watchdog_set_restart_priority()?

> > By the way, I have just noticed that even though this patch fixes the
> > reboot on a imx7ulp evk board, it does not work on a imx7ulp com
> > board.
> >
> > I will debug this, so please discard this patch for now. The other
> > ones of this series should be fine to apply.
> >
>
> Thanks for the update.

I have just retested this on a imx7ulp-com and imx7ulp-evk boards and
the "reboot" command is working fine on the two boards.

Looks like the issue I had earlier was related to dtb.

Thanks
