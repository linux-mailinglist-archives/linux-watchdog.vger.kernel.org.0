Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C694DA0C
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2019 21:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfFTTRG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Jun 2019 15:17:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37921 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfFTTRG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Jun 2019 15:17:06 -0400
Received: by mail-io1-f67.google.com with SMTP id j6so1039380ioa.5;
        Thu, 20 Jun 2019 12:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ib3L7OuMRjA8bgB09Os/hkdjlbd3vqU0W0NzPiRba3k=;
        b=tTy2Df3PNcLZI7/u46yGHzE5KTJkf7aTl7Se+G6dOl3po4cAmMoarGiZWd88B41Cr2
         V3emW6h6GBOo8KVLfCanXxC5zvPl9YH2ZTDwJJS8ydLwfkFaXSQJ6NPHz+LL3yVDVxQl
         tNfeR8q17ZvLoESI9D3b4qIEd/kYnFVMi1sEuaadaZ1RPtcZISd+/gMa6TuGyHBuKTWD
         NehgLcra8m47u0OWWxYvn8t+HS6dsJXQenjdTm3bIXB5n2MwcZO/QNJux4oXoXn+i4k6
         NzG7ZJzoq2D8eJl8IY74ZXfwKrexdmd6dpC52WxLSIFQWpCZh/JFgDxCjL6Rd9yuMp8E
         5Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ib3L7OuMRjA8bgB09Os/hkdjlbd3vqU0W0NzPiRba3k=;
        b=eYB4LAVJyMOQYJmUOlDh9ngkyz+JrKHy44QDewf/zkcUvAZ63qqKiKDh6uwb6n86DT
         olIE926D4IPlMVQ+qgxla5yTklVHB8QfisKtcbTV37njXqn8M67MDvgI6u1UDlKXq48Z
         Y4aOKrf8u1gIqCspcG/X7OyUOi/pilVumvpeALftPklzMUuMs1q/BZuocqLQoNa2ucJE
         qR/5269KtholyX840jRukRxTrLrhoXiQItC55LGWkMYOwUEBvy/wil/Vb0dgQ6kbOUoP
         EIQCuvmgFNAnO0L1LFeOJX12JEHWvs3G513Kuc8Z/bf/G3b5/dpA3bdcg7pR3GzNACwQ
         SXzQ==
X-Gm-Message-State: APjAAAUbKT3f0L85mUXiqoxW5xdhw5MENI1a/YWGgeUVY17qGU4FtkPr
        qs/KZTyGdD+oDJzJxHL/4PVmv3FXYavY5133wbM=
X-Google-Smtp-Source: APXvYqyc3WT1BkN2ASnm3IuHIhcm2V7CFmUmNKcBBA3KcGsn96s6AT7aRfxhEer7j8MrzbYSv7CGV/56qfVCGhXF1zk=
X-Received: by 2002:a6b:c9d8:: with SMTP id z207mr91310316iof.184.1561058224804;
 Thu, 20 Jun 2019 12:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <1561048126-27578-1-git-send-email-linux@roeck-us.net> <20190620170736.GA10902@anatevka>
In-Reply-To: <20190620170736.GA10902@anatevka>
From:   Sylvain Lemieux <slemieux.tyco@gmail.com>
Date:   Thu, 20 Jun 2019 15:16:53 -0400
Message-ID: <CA+rxa6qJJjFWmMOHL-mpJZ5e5YAan-7887bQPwC8KEfCmQaW+A@mail.gmail.com>
Subject: Re: [PATCH] watchdog: convert remaining drivers to use SPDX license identifier
To:     Jerry.Hoemann@hpe.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wan ZongShun <mcuos.com@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 20, 2019 at 1:07 PM Jerry Hoemann <jerry.hoemann@hpe.com> wrote:
>
> On Thu, Jun 20, 2019 at 09:28:46AM -0700, Guenter Roeck wrote:
> > This gets rid of the unnecessary license boilerplate, and avoids
> > having to deal with individual patches one by one.
> >
> > No functional changes.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > Note: Several drivers include a paragraph such as
> >
> > "Neither <name> nor <company> admit liability nor
> >  provide warranty for any of this software. This material is
> >  provided "AS-IS" and at no charge."
> >
> > Presumably this is covered by the GPL license. However, since I am not
> > an attorney, I am not sure, and I opted for leaving such paragraphs in
> > place.
> >
[...]
> >  drivers/watchdog/pnx4008_wdt.c         |  5 +----
[...]
> >  51 files changed, 54 insertions(+), 336 deletions(-)
> >
[...]
For pnx4008_wdt.c:

Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
