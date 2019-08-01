Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47BCD7D451
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2019 06:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfHAESy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Aug 2019 00:18:54 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:33196 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfHAESy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Aug 2019 00:18:54 -0400
Received: by mail-ot1-f42.google.com with SMTP id q20so72662813otl.0
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Jul 2019 21:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FO65nkcolwVx+yY/9hd+4e+/m5d8uRcLm0kV4ai0L5U=;
        b=EU/e3rmqZLdUDmkFK2ezGrIFFzWHy0k5vXLVrtjacaIEnq52Xs4Ny0vnX4Nsc0ZMfU
         9zgq5gzvWsRUscp7I8Zrhtaijmwr3WRirRjMaT4+OfjrYAOIu/OBqbQGo3lVyy/1fI5H
         j2mQjr6WUKtm7G+uLKOsImXnHEBNb1kJdVaLLL20BO+c2D/85Lkofq/IJyeYdq95OMir
         bixcp1GZya4RpwRfzd2CoDnqNaNgvtYo1OrthlWGq8uVuZuAhXsAXhneRgrPDGyZ1XIn
         FXg8LWiBO9AZmPeW3xM167abWX5orb4KBeTC6oEepR0d2YfY/Z3dtSl6pLW6BYo0vg22
         dRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FO65nkcolwVx+yY/9hd+4e+/m5d8uRcLm0kV4ai0L5U=;
        b=rxQG6Hy4u/vGLEp5+OAck2jHk/+bIi1W6UPxm6dx5kz0upSELXZa4l+77fsXjN0bIy
         FYiNLkxDye5NJOP1Twbp3xSQe+bWnP0qkYYAQNrCbDiIvn2f+Uo/0kbTMo+W3qj9O7Kk
         G6mbGeXc3VhS6/KRudld4gmA+2L9zfXA6U5QPps2EDObv8BMLjsTgDjuw37o7rOlRzle
         +5TVUqQ5Jsy2ubVvjo4Lue/ckm0YsDKf9Nw/KrcUvP83FjNoR13dL1xD2aVlHFF7nnBx
         ZHRJ48icAztO+NRDMiKCr/jO6RbKK6ggO2fLQQPlURGGHRDu4v7FDtC3UJTK3dQb5dsZ
         iyog==
X-Gm-Message-State: APjAAAWvFXHujpj4y53EW9C36EolUfvHOiKOkjVpLwOHKpLwDCVRsJqg
        2T1WxH/li1Lr9v20hvuJRGVnfGGIkzP2INMavpo4Ds6+
X-Google-Smtp-Source: APXvYqwLs5fl7YzgUm4aWq55eYjAWXctAwBeAy+ppJtf4l/W0+CQLuzhxKuaka1x5PpHNMbb8em+2sljpZFNqc6uWAE=
X-Received: by 2002:a9d:6f09:: with SMTP id n9mr24082660otq.335.1564633133275;
 Wed, 31 Jul 2019 21:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
 <97817286-92ae-cd13-4cc1-7a0355140414@roeck-us.net> <CAH3OF53G3bHfxpGVLHKns9k-QBAUroiqvkcdQ4d+gOmsLvaN6w@mail.gmail.com>
 <e1f4f561-ba33-b9ce-66db-c67cb260ecdf@roeck-us.net>
In-Reply-To: <e1f4f561-ba33-b9ce-66db-c67cb260ecdf@roeck-us.net>
From:   Vignesh Raman <vignesh.raman.in@gmail.com>
Date:   Thu, 1 Aug 2019 09:48:42 +0530
Message-ID: <CAH3OF53UrARyB8xnJLu4rXm2EJOzR9S2XViSMrmJXeeRuPgb3w@mail.gmail.com>
Subject: Re: watchdog: iTCO_wdt: failed to load
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com, mika.westerberg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Thu, Jul 25, 2019 at 6:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Here is your problem:
>
> 00100000-5e431017 : System RAM
>    00c5fffc-00c5ffff : iTCO_wdt
>
> The address range requested by the watchdog is marked by the BIOS as system memory.
>
> The patch referenced below tries to address a different problem and does not apply
> to your system.
>

Thanks for catching that. In working case the output of /proc/iomem is,

fd000000-fe7fffff : PCI Bus 0000:00
  fd000000-fdabffff : pnp 00:09
  fdac0000-fdacffff : pnp 00:0b
  fdad0000-fdadffff : pnp 00:09
  fdae0000-fdaeffff : pnp 00:0b
  fdaf0000-fdafffff : pnp 00:0b
  fdb00000-fdffffff : pnp 00:09
    fdc6000c-fdc6000f : iTCO_wdt
      fdc6000c-fdc6000f : iTCO_wdt

This explains why it works in another system (i7-6700).

Regards,
Vignesh
