Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB793EC74E
	for <lists+linux-watchdog@lfdr.de>; Sun, 15 Aug 2021 06:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhHOEcp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 15 Aug 2021 00:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbhHOEcp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 15 Aug 2021 00:32:45 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5EEC061764
        for <linux-watchdog@vger.kernel.org>; Sat, 14 Aug 2021 21:32:16 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r7so18852717wrs.0
        for <linux-watchdog@vger.kernel.org>; Sat, 14 Aug 2021 21:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=wY5tD1LUCn6LxhlCnyVFDbJ0CCKUuI625wcMj8RfDVk=;
        b=ZfAeOSMcK7ZdminTVG+fZs56XAmfFyczDC75+0kU0z7iWHLGKvygCAPFggnUbmzFrO
         RtS5vpmFomPPAdKVXeh6Wh3jG12nuZMeKYD6EXRzef0z271eGzjZ+8wNL0lIgOSEeE2l
         wrSxKRF1C2xYrvIwSdrz3fX2RqiP2wBUBRclquHPsX57cmOCAavsbcWpa6OPHapcKSCt
         CoRRJJc7Ag/yEesUHEPBGho0m2LFuahM0X9sGfkpa621ZNN4uq9Z5/e8+gTT08oY5sQo
         oOjAz2JOxlX66i6UszYt0Urq79s7z1ZFPMeBZ//ArxdrFe51jcCAgpRF3DyWS4eDV8LI
         66kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=wY5tD1LUCn6LxhlCnyVFDbJ0CCKUuI625wcMj8RfDVk=;
        b=iUG/odY7TWXW1COwWsuwUkB0AzarYKdpTGNptJZ1/xyBn+yaXKgE3/zh8wcTPZ02LN
         j0ev+Uz4A+v7K1PArBwjHM1d0QQRM64H1/aaoUdUhYi4gSxX8q0lb9kS3FFZikNGIird
         EG0elI0jvy2c0QUjwKQs6f5enjtxQa3edA4vKrkMPdLMbCi6U113T4b6rN2CtBJDVPFU
         cjmWY4gliGBJeIizZRqAAgm5AyysN65gPn1ww+TfwVtrLJLD/atZC7s2QV6XjUMVkxii
         0DgogwJVzO1olYWZeBwxoz1D3OY/bsJkj/H+SYrwyYlHiiSzvCBUxqAG4U04r3BlMdHX
         NWWw==
X-Gm-Message-State: AOAM531EVx+wANFcCj5c3j1sguJGRXJ6l5c7fezaboRz5XFN/MKHXwv4
        EJTzKbvcOjsMODmK6IitgT0YHync2TD4lfcjjZuY2zr6LK0=
X-Google-Smtp-Source: ABdhPJyFwo8fLsz2Y4OBwfExiMtHedp7/ZxmjHu3vI+YOA7OTYFfvsnVJCPxC7Kt28qCTcQBqRSsDHLrXRc74iW9big=
X-Received: by 2002:a5d:4447:: with SMTP id x7mr12038097wrr.198.1629001934588;
 Sat, 14 Aug 2021 21:32:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:e5c6:0:0:0:0:0 with HTTP; Sat, 14 Aug 2021 21:32:13
 -0700 (PDT)
In-Reply-To: <b9818198-48f1-c75e-2dbe-eabfc36b6725@roeck-us.net>
References: <20210814191345.27221-1-ginermail@gmail.com> <20210814195646.GB3951799@roeck-us.net>
 <CAPeRZrV+HwdmBKFB3tmG_tEHjsR8h3WLxKQYGDLOLgw178oq=A@mail.gmail.com> <b9818198-48f1-c75e-2dbe-eabfc36b6725@roeck-us.net>
From:   Stanislav German-Evtushenko <ginermail@gmail.com>
Date:   Sun, 15 Aug 2021 04:32:13 +0000
Message-ID: <CAPeRZrWeiQRWhVi5N2ho=RhvaSjR4NcMFGgewWkfM5tj+tSRaQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: Device must be opened for writing
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/15/21, Guenter Roeck <linux@roeck-us.net> wrote:
> On 8/14/21 5:19 PM, Stanislav German-Evtushenko wrote:
>> On Saturday, August 14, 2021, Guenter Roeck <linux@roeck-us.net
>> <mailto:linux@roeck-us.net>> wrote:
>>  > On Sun, Aug 15, 2021 at 04:13:45AM +0900, Stanislav German-Evtushenko
>> wrote:
>>  >> If userspace opens the watchdog device self-feeding stops. Sometimes
>>  >> opening the device happens by accident, e.g. by mistakenly running
>> grep
>>  >> recursively in a wrong directory which leads to the server being
>> reset.
>>  >>
>>  >> Watchdog device does not handle read operation therefore the issue can
>> be
>>  >> prevented by requiring the device to be opened for writing:
>>  >>
>>  >> - Prevent opening the device without FMODE_WRITE
>>  >>
>>  >> Signed-off-by: Stanislav German-Evtushenko <ginermail@gmail.com
>> <mailto:ginermail@gmail.com>>
>>  >
>>  > NACK. That would be a major undocumented ABI change. Opening
>> /dev/watchdog
>>  > for reading can be and is used today to test a watchdog.
>>  >
>>  > Guenter
>>  >
>>
>> I see. This is unfortunate.
>>
>> In this case I'll try to find the right place in the documentation and
>> make it more explicit unless it is already there and I've overlooked.
>>
> No. That isn't the point. This is used and must not be changed.
> Again, people (including me( are _using_ this to test watchdogs.
> We are not going to disable that because some people are not
> careful when executing commands as root.
>
> Guenter
>

I mean I would describe the existing behavior as this is not obvious.

As for testing, opening for writing is not harder than for reading but
I understand that it would be a breaking change now.
