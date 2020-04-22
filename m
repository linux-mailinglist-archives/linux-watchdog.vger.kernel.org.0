Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0101B3415
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Apr 2020 02:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgDVAlI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Apr 2020 20:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgDVAlI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Apr 2020 20:41:08 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BDCC0610D5
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 17:41:08 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id o19so787760qkk.5
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 17:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXWORpjRxTkR+i2fu0N9aGTa6+ZQqTZNmK158+3pxDo=;
        b=XXLAHVjCxmQ0g6P2WSs/mW+8skAgEVSeb5nc/EBOC+NLqjYIAm5C09vy+AXo9NYmfF
         NuHUkcuMDH0a1DRZzGjmt54BElkiJlno6nBpxUT0EPKcmqSA4/bYO2WbY7dzaNrsqOn5
         cyDQd1ZAV0QjIHtu5L4OU2ziPMQrf7AdumzEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXWORpjRxTkR+i2fu0N9aGTa6+ZQqTZNmK158+3pxDo=;
        b=Lep/KqTaxcVn9uDJM/co7MutqWfSEwYVXKFHC6VyRvW9EOmGCcS+YXzwMkqlMZxEhZ
         JBLp1ijttOKEE2E31V+7qD57qU2w2oE9bOlBYvH/ITZkCpc9soqdmHSmZlJQ5rPwz0BG
         G+4IkOQqqO1RiBJvAp/CD1L7CoOOokjuhZSmiuYyqHoUUujQc6l/3HEaS64+Lmrpuxji
         q6ACdfQM3rOqmK4vAelZwcsIt89C0z2aKLl6l93IeCTiA2YGHwdokwlEG2wgOJcxRTdj
         y6xZqE7XJ51hNrS+lwxXDZnBuKSHb0odbF+B3cHnfBmn7zrudKZiq5BAywwlShMiBWBl
         046Q==
X-Gm-Message-State: AGi0PubDUf1NhIH82zDEl9bzOaA7laDn/3I3P7xfszJUEKyLQVPMKnfM
        zb17KEGr3B6XTfxsrEQ8Viq4VpaIyOA=
X-Google-Smtp-Source: APiQypLWyY1PR2VseWm4XENJo1TBwDChoC8I8vdAhMVVMUzqKncE20AsqRIHuExcMz0zbul9+Yz/gA==
X-Received: by 2002:a37:9b4a:: with SMTP id d71mr23512878qke.382.1587516067097;
        Tue, 21 Apr 2020 17:41:07 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id z2sm2850981qkc.28.2020.04.21.17.41.05
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 17:41:06 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id o198so282163ybg.10
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 17:41:05 -0700 (PDT)
X-Received: by 2002:ab0:592c:: with SMTP id n41mr14287181uad.73.1587516064329;
 Tue, 21 Apr 2020 17:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org> <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
In-Reply-To: <e81737bc-9461-0fdb-245f-d88bdde8f0ee@roeck-us.net>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Wed, 22 Apr 2020 10:40:37 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0wAN4rG8xF1Y7amshoECJAjiWNDFQ5GQHPAbCfXi1bDg@mail.gmail.com>
Message-ID: <CAKz_xw0wAN4rG8xF1Y7amshoECJAjiWNDFQ5GQHPAbCfXi1bDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor Calls.
To:     Guenter Roeck <linux@roeck-us.net>, Simon Glass <sjg@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Julius Werner <jwerner@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
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

> Subject says v2. This is confusing, at the very least.
>
> Guenter

Apologies! I am using the patman script, it threw this message that I
did not understand: 'Change log for unknown version v3'.
And I did not spot the issue in the emails before send. Not sure why
patman worked for v2 and v3 but not v4... I will take a look.

Evan
