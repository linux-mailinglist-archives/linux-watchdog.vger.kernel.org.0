Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37952E0FE3
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Dec 2020 22:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgLVVm5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Dec 2020 16:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgLVVm4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Dec 2020 16:42:56 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4702CC0613D3
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Dec 2020 13:42:16 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id h205so35365861lfd.5
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Dec 2020 13:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xmy4SQdwbm2DHPXN83yCBh3DyLsFV3D3oMOlf06BH5A=;
        b=HQBULK6iPt8405aC1NTIJFAKBDXFRKgGWawI9VEEvYt91P7EOVV0IFrtryGEIZHCeM
         lPNnDa4XkWW+3QZvRe/JtARxqQZn2V3veFd6VVokMcy6Q+EcT9yjcch38xGSL3BqVpIT
         kvYdVnLyrlCpmpNyjMsPLGSCc4bSUOO1/AspM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xmy4SQdwbm2DHPXN83yCBh3DyLsFV3D3oMOlf06BH5A=;
        b=XCD7RiuDEIMEG/aNexnFENip6S0MWpzg6VlfGizJU24anIUrvvBQoKdMyG3kswGI8o
         r6X3e4ZPxDd4x3+iIKzMyfn93idJcKvkdKlmZufQXIEFsJRfIEp8Mtnk/OtAdLRTVT8I
         lHC+B5ArUuacqsCt/7A1oiP1gPhbXbAlwrsHcu84sKPmfFaY47hDETHWGhZ0uAZg5M58
         xIFmkSu8ASMd6qg62HKkdjL+0ZRIU+WKFgd+7zWEX7smylqUeTqIAc6ctARTnZPwDJQ1
         zSU2qIJ3qI86QxLaasx/ds7A53Uqub9hTCrp3J60H/LhC+HvFtyo4JyrfaF1NgUIzZ0K
         +RvQ==
X-Gm-Message-State: AOAM532YsTJgwmhZhdIqT2UvWh7uJ0jLRQ2kltt1fye8UQLlweLPxOzY
        RAJIwjYrQadxcSBsc/hgzDRd0uTHkAKxyQ==
X-Google-Smtp-Source: ABdhPJxyRzWnFQH8RxEaJthjgv+qX96uHz8TGR0CpT3+jRTcUV+/tNg9HA3YMC9YyMIcpRsfum2aIw==
X-Received: by 2002:a05:651c:1107:: with SMTP id d7mr10379899ljo.10.1608673334573;
        Tue, 22 Dec 2020 13:42:14 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 189sm2838653lfi.232.2020.12.22.13.42.14
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 13:42:14 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id b26so25856364lff.9
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Dec 2020 13:42:14 -0800 (PST)
X-Received: by 2002:a2e:8995:: with SMTP id c21mr10175875lji.251.1608672862232;
 Tue, 22 Dec 2020 13:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20201222163452.GA1524@www.linux-watchdog.org>
In-Reply-To: <20201222163452.GA1524@www.linux-watchdog.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 22 Dec 2020 13:34:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEHYdDMwUqy0LqWMvAOqkce6Dj6Q5dkUpJOdd01sVhdw@mail.gmail.com>
Message-ID: <CAHk-=wjEHYdDMwUqy0LqWMvAOqkce6Dj6Q5dkUpJOdd01sVhdw@mail.gmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v5.11 Merge window
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        EnricoWeigelt@www.linux-watchdog.org,
        metux IT consult <info@metux.net>,
        Etienne Carriere <etienne.carriere@st.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Robert Marko <robert.marko@sartura.hr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tom Rix <trix@redhat.com>,
        Wang Wensheng <wangwensheng4@huawei.com>,
        Wong Vee Khee <vee.khee.wong@intel.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Zhao Qiang <qiang.zhao@nxp.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Dec 22, 2020 at 9:42 AM Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
>
>   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-5.11-rc1

There's no such tag there. Forgot to push out?

I can see the the top-of-tree has the SHA1 that you mention:

> for you to fetch changes up to 0b9491b621196a5d7f163dde81d98e0687bdba97:

but the tag itself is missing. And outside of kernel.org, I do require
signed tags (and even on kernel.org I very strongly prefer them), so I
won't just pull that HEAD branch.

             Linus
