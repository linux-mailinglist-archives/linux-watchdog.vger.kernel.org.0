Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA723DE63F
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Aug 2021 07:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbhHCFiO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Aug 2021 01:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbhHCFiN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Aug 2021 01:38:13 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737C9C0613D5
        for <linux-watchdog@vger.kernel.org>; Mon,  2 Aug 2021 22:38:03 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id z7so22162589iog.13
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Aug 2021 22:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vi76Iy2+G7lRArH6vuam1Hfh2GEzigTGHE+mXu3eEQw=;
        b=qLj1y6fObSImVY0F0di8u/IF17wANqqqgvULYkhwRpKAGIdln28rEco4Riz8tMS4z+
         3ZfBL+GTgm0I3uYsrPqR38H1ZePcnoxJJA5jHljoEUgk57jKKhKJvmj1uXlK8Fcrcnfw
         IYoUcNNbQStu/smuDcK/AU7hIRpe5mCbAHIJtLG4wBYq1OiM5cIO1KCjwMHyu3O6SzwR
         VSrTFDVzKDqdZwOqIY+qk3GT8nxZWCAXeKQiVxkNrWwQKgihwE1nYU1//j0WTbUzxCiw
         GlEZZTBXyEK8nzark4WGWGiA/azDDniWdirEvCdMJ9NtpU6nygtVUuN0+rQgaX56lt0I
         pD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vi76Iy2+G7lRArH6vuam1Hfh2GEzigTGHE+mXu3eEQw=;
        b=rB2TL3e0zSC3ZvK5TWzKtQjeqHx5zgAh3dxgU8jbvtJsn73rVog0GrV25Gqt5kwjsF
         W5qLC6G4mNi1ru1iAHglfephgimCDQBZ9zucRD02sEXxN8Fqr6w5hdc49X9F3HOpUi+9
         dIr9NfPDkfx32sOCHYbPRs0N0IHmQrQ40pL2Sq4zGLaZy1ydpE+Qpg0kZHWL+asJ21sP
         +F6HVQ/5GXbfFazOcVlYXxdE4AE6vt6oQZz3a5B1CmbdGl0JbvwoCGsT0Fw5iHLqQc4d
         4YcWXp7GD2NBUyQ3RsyqJ/yttg4mgITozmzZ1McEumSBqRy0XjxolKGPPS8384r1jwbq
         dmHQ==
X-Gm-Message-State: AOAM533UF0X5RgHm6kPACLtEWh0HiZSZOQ7eqc09rLzTV6pH9fLxfsUF
        wVw/GGW7a12wdt/2JXP7OFw6k9Y8KCjR4+LzKIqSMTYnLz/XRw==
X-Google-Smtp-Source: ABdhPJw/2YigJyn4JYO2+qd6bLRkOERLsf4W8mUBRLblDDC0N6ey6KPmqUc7erPS6iYqy2aN3qVsIE+0gB6rMCfF710=
X-Received: by 2002:a02:ba87:: with SMTP id g7mr11453418jao.110.1627969081709;
 Mon, 02 Aug 2021 22:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210726122901.12195-1-Christine.Zhu@mediatek.com> <20210726122901.12195-2-Christine.Zhu@mediatek.com>
In-Reply-To: <20210726122901.12195-2-Christine.Zhu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 3 Aug 2021 13:37:50 +0800
Message-ID: <CA+Px+wX+gy4hV3BsTU81ThS=FUe0HidUV-iZZvQ3qm4WxKXGxQ@mail.gmail.com>
Subject: Re: [v7,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
To:     Christine Zhu <christine.zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        matthias.bgg@gmail.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 26, 2021 at 8:30 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> @@ -13,6 +13,7 @@ Required properties:
>         "mediatek,mt8183-wdt": for MT8183
>         "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>         "mediatek,mt8192-wdt": for MT8192
> +       "mediatek,mt8195-wdt": for MT8195
Just realized the patch has been applied in commit b326f2c85f3d
("dt-bindings: watchdog: Add compatible for Mediatek MT8195").  Could
you rebase the series to the latest tree and resend?
