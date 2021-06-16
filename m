Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1B33AA2B7
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jun 2021 19:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhFPR7r (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Jun 2021 13:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFPR7q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Jun 2021 13:59:46 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB595C061574;
        Wed, 16 Jun 2021 10:57:38 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so3383003otl.3;
        Wed, 16 Jun 2021 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JqX+3DOA7ox/K5I0DpI1KknuOiKmOjzSyVKeXkp2TrA=;
        b=dW02d5zGn/AmpCC7+x7DtbTbgBQUU5rhRi5ucgHUmHzYDGQ7MV2MssEJUNg2Fs1f0O
         CI/8/QGQGgPsOsamCwp17LNyN5AEePLUNB3WD1tcFCLD5XZO+oMVysfmQ5a52L6O6soU
         4A/zLfkl03ILTmQTIOHrNhbkMB27WqRXj14lsLDhxGkbq7NXoVRMRlCWVo3wpCd2kwKp
         U3bmCEZTuNX6KyjoIGn5dqKgizTYu790Mc/IM/jG6kc9LhfzDSg0TM6Y0i8Mg4B42S7D
         Ip/NdkleRjTB0jVcgaLKetpz3gqeqRu/VP32kg+HybxOPEAogsQRycFbKK3MuwN/tt+p
         kKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=JqX+3DOA7ox/K5I0DpI1KknuOiKmOjzSyVKeXkp2TrA=;
        b=jcQv+EN03Q66DVRps6SPpdBgJO9zIM0BpRHDwEzBxu6ZBmd4iVuFcAV8gLmDdqF0ey
         6PEcZtJJwr5mSyM1dZ3hmcndtCvNatqx7T95V+XLvpE+Q07+eZD6n3v2ByOTE9WTj4cC
         0OzujPtnkg61jyXohBYGcgnlFGaM/MTPXDe9PwyKsajNErUryrW4RX22eTg+/lt6dC9J
         dqVcPt7BUbxbMydr9Vjt8u4b74KlIzzbWa6Dcea0O/bZvBNP6nnQ0kyz9endYEl6d764
         khRU7J4HkjULs0xI169QFPODz2HrPJmlCqe+CcDj9E3o0gZeKMM2FVmsBZj+fMY9CcRP
         m74Q==
X-Gm-Message-State: AOAM532+a/YLJg7tehvljQC4K6WhNJsn2cx1SBCjLcsqO+XfhbAL72jV
        iL2HC+rnAMXifRuGu0/Gw88=
X-Google-Smtp-Source: ABdhPJzmOzu7KIoqx7Mb7WZFe1iH6MviLNFAso/5uTUXBN5hGjq0QAfY/jsOndkMXIxuTcutLFhSgA==
X-Received: by 2002:a9d:226c:: with SMTP id o99mr929729ota.134.1623866258213;
        Wed, 16 Jun 2021 10:57:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z6sm575517oiz.39.2021.06.16.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:57:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 16 Jun 2021 10:57:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: introduce watchdog_dev_suspend/resume
Message-ID: <20210616175735.GA1111788@roeck-us.net>
References: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
 <20210615123904.2568052-2-grzegorz.jaszczyk@linaro.org>
 <20210615141803.GA957871@roeck-us.net>
 <CAMxfBF7EZRaCcrCYmY1RkWytWWHiH7xATfzKO68Hqtf3M--L_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMxfBF7EZRaCcrCYmY1RkWytWWHiH7xATfzKO68Hqtf3M--L_Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 16, 2021 at 03:59:23PM +0200, Grzegorz Jaszczyk wrote:
> On Tue, 15 Jun 2021 at 16:18, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Tue, Jun 15, 2021 at 02:39:03PM +0200, Grzegorz Jaszczyk wrote:
> > > The watchdog drivers often disable wdog clock during suspend and then
> > > enable it again during resume. Nevertheless the ping worker is still
> > > running and can issue low-level ping while the wdog clock is disabled
> > > causing the system hang. To prevent such condition introduce
> > > watchdog_dev_suspend/resume which can be used by any wdog driver and
> > > actually cancel ping worker during suspend and restore it back, if
> > > needed, during resume.
> > >
> >
> > I'll have to look into this further, but I don't think this is the correct
> > solution. Most likely the watchdog core needs to have its own independent
> > suspend/resule functions and suspend the high resolution timer on
> > suspend and restore it on resume. This may require an additional flag
> > to be set by drivers to indicate that the timer should be stopped on
> > suspend.
> 
> That makes sense - thank you for your suggestion. I think I could
> register a pm notifier in the watchdog core when the new e.g.
> WDOG_STOP_PING_ON_SUSPEND status flag will be set by the driver and
> actually call watchdog_dev_suspend/resume from the notifier callback.
> Please let me know if you see any other issue with this solution, if
> not I will post v2.
> 
Go for it.

Thanks,
Guenter
