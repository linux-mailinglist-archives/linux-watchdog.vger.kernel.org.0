Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 822A416F41F
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2020 01:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgBZAPy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 Feb 2020 19:15:54 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:34760 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbgBZAPy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 Feb 2020 19:15:54 -0500
Received: by mail-ua1-f52.google.com with SMTP id 1so356214uao.1
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Feb 2020 16:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oTRomC2W+BSThGwAQZ4mFHuy58uAWVt5delRT81IvjU=;
        b=MyRXyQ29K/5rD2ii3vJTRTLOQGj7HhOiybWmpSn7wQARePsB21oMCNPqUfbw9IaLkk
         fEjTnM0c2DDcQCOnKybAVQGg6IvEpPJl+yg2p7SHDkweG+05yI8+cKr/gCSIP1gB7R1F
         2uI0P2Q2CK/LKaq2R3M3UpOFhAR122qdsb7KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oTRomC2W+BSThGwAQZ4mFHuy58uAWVt5delRT81IvjU=;
        b=JZ5xzVM8gQqDP6A4N40ekjRkxVV+BWH+cEWmWL4UBmEy9p0CJxEq18oJ4nBWX5ylYn
         /O/VAJwN1Pj4S7sTvHx8swRbtstlzV8eHXh1HWHLi5uRHTRfc+MFI4OI/BCzzWsnY7I4
         /ZBLYGLBb6IR80Bfwzx2q4i+3axHGJhvrhOKNPeUcjsL4GW8L7UCPKAUV5jiF4znx1gQ
         Tt7gYu/WlpRh+UbWYIEFSc5TQBsT6IkIzlyrDqEP2EmiqErWXpis38AiLiB/sj4obeW+
         Qqqg8ucxOsskJHdza1/csdnsM0MrArDQxfH8JS6PGJyPHy/5CLNdFVhIzNyt4qxQraps
         LlPg==
X-Gm-Message-State: APjAAAXVXrt+13YmKq3azt67e28Y6TdZEv8rv7fX0foIJcPgz1eGNj97
        mNabI5oMjLQsI6V1Tx1T2kuOSbhes0Y=
X-Google-Smtp-Source: APXvYqxtC9wP6aTsDHlnYTgAVN5cZqAwdKyp5hdpkr873XVLyHBxJBakFU+PRZqYC/UmVgSvPBQAqA==
X-Received: by 2002:ab0:6258:: with SMTP id p24mr1791306uao.24.1582676152700;
        Tue, 25 Feb 2020 16:15:52 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id i3sm108193vso.3.2020.02.25.16.15.50
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2020 16:15:51 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id g15so703131vsf.1
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Feb 2020 16:15:50 -0800 (PST)
X-Received: by 2002:a67:f541:: with SMTP id z1mr1739800vsn.70.1582676150352;
 Tue, 25 Feb 2020 16:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org> <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Wed, 26 Feb 2020 11:15:24 +1100
X-Gmail-Original-Message-ID: <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com>
Message-ID: <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
To:     Rob Herring <robh+dt@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks Rob

> This should be a child of some Mediatek firmware node. I assume
> watchdog is not the *only* function.

I am not quite sure what you mean, do you intend this:

 firmware {
   watchdog {
     ...
   }
}

I do not have a deep understanding of devicetree yet, can you point me
to anything that will help me understand
the consequences of that change?

Thanks

Evan
