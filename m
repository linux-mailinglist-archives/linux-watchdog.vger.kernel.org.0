Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3772180A8
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jul 2020 09:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgGHHSD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jul 2020 03:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbgGHHSC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jul 2020 03:18:02 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E713C061755
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Jul 2020 00:18:02 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so40739800edq.8
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jul 2020 00:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HUGD/S+GEk5VECplCes3Yk8kYGwUbUvVAZ00O9FQW/o=;
        b=kos1f4blni6xuAyaqcgyYJMUQWKVAy60G6bKfYz9A5fm69kFXQZ5bonW41XVUGPw05
         4De3VTuZtdqsJ6ROI4wsd/TsLa2iL8mTJgjkHwuYOm2qTVJEU9cx1UJHE8IdiheS/yof
         QwwOONkpB2MWQ5y4O/cztZPO5kBP3ionnsC8pp8GhbhYM+5n8G4Ev6UCv1ClzXNGdiaQ
         VAlZKrMh9z31ZqS9BlqfdILygRpXzwYyCURQloqGBxDrW8Z2TFFa1MVUgz8W9sbfK5Hv
         WHRIDytR/4DXn75z9lTthmN66/gpn9SzyBHbk7VPVSA1hQFodxUmpDPqsiuAxpWRU8AH
         /fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HUGD/S+GEk5VECplCes3Yk8kYGwUbUvVAZ00O9FQW/o=;
        b=iPFGsoTLqhDVCkIIbL0no4khpJKSvBLQ6Xey3Fg0/w1HexwCSx3BicB9/QjYiVwcwO
         TQ1xd+7gDRlHubGzh90yWg0fjg0IC+5QhAV7yTUZguwIKsQitYYcBBMiqeT9BDbexzoB
         LSS1b4bWtP5jWf/cSpqq4+OAuaJIySezExMnt3vkDCWbwD8qa1D08ICwAQngRQ7svAFX
         XPZGAthCsXEamx1zbmr2LofZIr4dTayGPqWeqhYuUZT1sBIxaKY4IR+pzSFmzZHJmz/u
         f1HG1OOetoGUyzbYhi6rSL9213RKU2bwHhSK/biuIUxZLJa2yoaADdt/Zc7x9GM/o4Ml
         SVwQ==
X-Gm-Message-State: AOAM532KDzVisknUdnNUCwmStHcGiiHKQFoCWGWHhIKPOjwMrCoj8kS6
        Kg4PPjnlv4lLCxJJ7T4LDe6Hy/KXWDohObbicbma+/vck5Q=
X-Google-Smtp-Source: ABdhPJx90knx8CiTADejxWTxsC9Yh2x45VHlpXrTK91iYy5mbDiRmJkvyK28AwoEEHMFWN4DjlUuxuF/YNiA1J7HPxY=
X-Received: by 2002:aa7:c80f:: with SMTP id a15mr63700849edt.299.1594192680942;
 Wed, 08 Jul 2020 00:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200701110339.2833449-1-woodylin@google.com> <20200707040356.GA213018@roeck-us.net>
 <CAHn4DedP=r0UwN4bn=A3nH_2bcEFA24SEYSq4gJUcC9w9p0UKQ@mail.gmail.com> <8e16b12c-1097-dea7-32d7-f3381568407a@roeck-us.net>
In-Reply-To: <8e16b12c-1097-dea7-32d7-f3381568407a@roeck-us.net>
From:   Woody Lin <woodylin@google.com>
Date:   Wed, 8 Jul 2020 15:17:49 +0800
Message-ID: <CAHn4DecB9OD=PACzr7H6=+P2xUjpMRJz8TQ6pYPZypVkzdx02Q@mail.gmail.com>
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and 'soft_active_on_boot'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 7, 2020 at 7:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
> I'd rather see something like "<not set>". "<null>" looks like an error.
> Also, it isn't correct to assume emergency reboot; that is only correct
> if neither soft_noboot nor soft_panic is set.

"<not set>" sounds good to me, and thanks for correcting my usage
description on "(emergency reboot)".
I'm uploading the next version.

Woody
