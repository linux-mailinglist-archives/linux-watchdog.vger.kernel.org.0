Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F7C19E20A
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Apr 2020 03:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgDDBI6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Apr 2020 21:08:58 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38693 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgDDBI6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Apr 2020 21:08:58 -0400
Received: by mail-pj1-f66.google.com with SMTP id m15so3812714pje.3
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Apr 2020 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O6b2gnL33BXhVFyfbJth5+UU7eciSHYX3oxtDKEDuDA=;
        b=alUJeSWDQbazGmCHaD3vGtuEij3VFxX3HTi56q8fbqaiBp7/Y6J7p4a0acMrl7kInW
         X0JbVTtUVvSwa+p2769ApqQW7OcZsWyXCQkuQCxepnyx8UF3+h0nm3E2wSbAjzoh6pmH
         YX5cL9Gly/HX3522R8CBtJKjQTggV2WVU4SLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O6b2gnL33BXhVFyfbJth5+UU7eciSHYX3oxtDKEDuDA=;
        b=V2MoQlsCHK+uuSTJhCOuiu1VIc496QzrnjGn2VrgQ3TZxS0t3udjhEu/ZQdc4VVLQ4
         Jtn9iOyeVXR1OVzpEqTuwWdxqlWCxnGshYrAVqIX19rkxIk3dhS4d/pG+3v8i7V1w+XD
         TnwFZeb25HQw9SvzDYlvEtpuEBdh5yjspq8vXsMFwLCEXuMydtJz5qdhWWVk+3c2z1Fr
         arzV76PPgwv/00OukJMqJcyoRQjWnn5F8UMySz6uho3PCAYdJ0xWd/USpTAiNDvLfVw0
         WFfA4OwDVh3X/V54o23QUr9c3fjp3P1ro1aRg3Mp+BXj8Ds/57M+Z1g6Pk8OsReYUDgJ
         KncQ==
X-Gm-Message-State: AGi0PuaDOWYsAB5wkz2SucSopacruWOjQIbsqz7w+JWFxjEHsVQAwiSk
        zJK+ARAXR10eg53zujtogwUe2RKMn5AOPg==
X-Google-Smtp-Source: APiQypLzYWERP7ObEnRfa9OAin0aq5mQCkoKYvilcAICtghVyb/90PbgQuJA9LzeNu0XfSWDhTM9Cg==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr10548733plo.280.1585962536681;
        Fri, 03 Apr 2020 18:08:56 -0700 (PDT)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id s65sm200781pgs.30.2020.04.03.18.08.56
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 18:08:56 -0700 (PDT)
Received: by mail-pf1-f177.google.com with SMTP id c20so4471160pfi.7
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Apr 2020 18:08:56 -0700 (PDT)
X-Received: by 2002:a1f:e546:: with SMTP id c67mr8715562vkh.38.1585962045690;
 Fri, 03 Apr 2020 18:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <20200403162742.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid> <CAODwPW_iSK_d6EHCk7QUVF7=bHVLuUYHX5mfapf+yeyuHHdNZA@mail.gmail.com>
In-Reply-To: <CAODwPW_iSK_d6EHCk7QUVF7=bHVLuUYHX5mfapf+yeyuHHdNZA@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Sat, 4 Apr 2020 12:00:18 +1100
X-Gmail-Original-Message-ID: <CAKz_xw3W3xWBfspj0DmbR-p8qF9A+sSsuT_euqmYNbx=47HpoQ@mail.gmail.com>
Message-ID: <CAKz_xw3W3xWBfspj0DmbR-p8qF9A+sSsuT_euqmYNbx=47HpoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smd_wdt watchdog driver
To:     Julius Werner <jwerner@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
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

On Sat, Apr 4, 2020 at 9:56 AM Julius Werner <jwerner@chromium.org> wrote:
>
> > +       wdd->info = &smcwd_info;
> > +       /* get_timeleft is optional */
> > +       if (smcwd_call(SMCWD_GET_TIMELEFT, 0, NULL))
>
> How is this supposed to work? A firmware that implements this call
> would return the time left here which may not be 0 (maybe the watchdog
> was already primed by the bootloader or whatever), so smcwd_call()
> would interpret it as an error.
>
> I think the cleanest solution would be to stick to the same return
> codes in a0 and use a1 to report the time left when a0 is
> PSCI_SUCCESS. This is more consistent with SMCWD_INIT too.

Yes you are right, I have the wrong return code in the get_timeleft
implementation. It should use ->a1 for the actual timeleft, a0 is for
the error code.

Here smcwd_call returns the error code, which is NOT_IMPLEMENTED if
the firmware does not implement timeleft. The timeleft itself cannot
return error codes else we would just return that there I guess.
