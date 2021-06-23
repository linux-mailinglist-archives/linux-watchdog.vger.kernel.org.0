Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6053B1213
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 05:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhFWDTL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 23:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWDTK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 23:19:10 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE29C061756
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Jun 2021 20:16:53 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id 17so1208948ill.6
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Jun 2021 20:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gwyk7uli6oIz3rIWuS93ZiR/95eoNtAhejgjw8V2c7g=;
        b=avVKkKEQPXbX8szL6W+xHS+ytLCq2BWNqxMK9GEjcewzrreXGygKiJm008njmzuq65
         +SWBWp0oNN2jRB6aWjUJqcfuDXId0DEEV3xib0KEeE062n2iE3HNC+mFky2wDt54VNFL
         7rAnRH+0GILJJWCzxRk+sa6IYtUe3G8/ZGBZSXTUhUnRwuUjKVyQXyK13Te4BysOSy2Y
         B/HOnLH1aitT9UMUwhF2OPwwdIHrQFvesSrnHPz3noinYhvvJfqINRTYbq9l0X8COuSl
         549txwfUsNnTU8ZusF2GaQnQjAsgVwYxLt/h9mbhikUtKQjYpOc1TewyHWX7HmaYoVCR
         SLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gwyk7uli6oIz3rIWuS93ZiR/95eoNtAhejgjw8V2c7g=;
        b=ZMD+GH4qPnFRJ3pY9XC/6uiq9fAhoeXR6596mcBQUr0XJBVdjTtFhmpF2L9FbIonBO
         nDc0xWcBhm3z9dpss+nsuITd1RMnPISqXBCsaTxoG2lZcr0BzEZYjUktl+iY85qGlnwp
         I2XB3tPq4SViDq5TmIi07AZpIXPctJGMaR3qDTKwKgHxJH0b1+0T6fWaiRxq6v+gjQFv
         e4RmMTRtx6SKGz/pnjpavHp2oCB6+NR8O+6jzD/T6jhB9vBNVPveBSBTDKVFEeKd61co
         E5W3SpV9vheV3PrzkqVC/AoEjhAGb/7LrJZqu1a3QWzivRcPat6+ZYVjqL0W48rRSJ+4
         1z+Q==
X-Gm-Message-State: AOAM533dTD96nH/SO9Ru6z7D/CdWERVD3r+y44BkcQnmqW40kOAcTjL+
        0UBmhSoFyJ3BpvQQ68Q8O8VWMVzyD9zg3LeC1O9brw==
X-Google-Smtp-Source: ABdhPJwDUOZOr0sb7xGTIyDuC/tlmAEbEEUDUVcs8ySJRF91dcjveUjtvj2sMOPkvNe7zxFjvxgPTdywtnclmsqcv1Q=
X-Received: by 2002:a05:6e02:1be1:: with SMTP id y1mr1377528ilv.204.1624418212873;
 Tue, 22 Jun 2021 20:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210622151734.29429-1-Christine.Zhu@mediatek.com>
In-Reply-To: <20210622151734.29429-1-Christine.Zhu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 23 Jun 2021 11:16:42 +0800
Message-ID: <CA+Px+wV7fZ_8-GfdjshKcBV+VaiFNxTq4dcKUK8EoHxzyuZVww@mail.gmail.com>
Subject: Re: [v2,0/3] watchdog: mt8195: add wdt support
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

On Tue, Jun 22, 2021 at 11:18 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> christine.zhu (3):
>   dt-binding: mediatek: mt8195: update mtk-wdt document
>   dt-binding: reset: mt8195: add toprgu reset-controller head file
See [1] as a reference, "dt-bindings" is preferred.

>   watchdog: mediatek: mt8195: add wdt support
If the commit messages in the 3 patches are sentences, they should end
with a period (i.e. ".").

[1]: https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html
