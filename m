Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F042CF12
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 01:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJMXUS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 19:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhJMXUR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 19:20:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4555C061570
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 16:18:13 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y12so17107290eda.4
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 16:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kw7XSv2zPAZff62JzeEPimh2RW/EXwm2l1qI36Jaog=;
        b=xXrermu5yxfhoOzS2baE8TehzLj+k4pFlC56Is9e8D8DwHUKd30EZ00KjGv1GF2Y2x
         /dRmRa71+bjImJxm2sR4+VM1KPzvl2Gm6VVcsgkxFftx7W0GnlEX8IOTAChTh7xDx+id
         zdKhoDqzYq+0ocxNHujVJXUg5sEe7DbvMSIkqjFzdJX/XJiUkIc3BMd03K9tVvbl5tSz
         cVwRpUvLKUx5iCPR9rpaGD2DEhFyf84n9u18Uy3KFGNXKMirDKx0/vJ2C+U0jKamqgU6
         4tZPiX07XxXJ7raZisKZCWMPyJ44gHPYPBtF/P3AXaC1KqGKt9t1AuxnNfiMDUuGdqsI
         9DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kw7XSv2zPAZff62JzeEPimh2RW/EXwm2l1qI36Jaog=;
        b=vvI4gCjoHaRmMPMALlXFg3hrzbY8Pyy0iFKOHKJzRD0k6Fc4DkC0vVU/vmx4UEK1qA
         tJ6D8Fox2lTm7B7vAA6PgySk5XgfneNSZ2h8TBnZ8YpguLXzy0ZFUhAU/Hu9CpS878Z6
         wg7v1pem4wHCep/uUPxkJjbqwAvy5aeN8h5BLtREL1Kv42sbmV8rL3FmJEAmBulmQyBQ
         S39aD7n3l+p9CI6jzz2BiuaJjGfA28F2DCqdbnvHtMRWPIlQ2SGWKDXl+Yw6UGSxhuKA
         vnsUSiPBftbf+2MwMN3I3BbdjZcltCnj4Z3RbaVOmYKxvJUjf7Ph9Now0q7vFa4j86gv
         50ww==
X-Gm-Message-State: AOAM533f7rVI5+O5KAcvOQI0fnzr3DVQpTbZcUD4lhgtkH0LPAfOwKQY
        B46COtaHuulG0yG7GtLU0J8n4puRFA0lAKE5G6gAx+cc+Tw=
X-Google-Smtp-Source: ABdhPJyqw/im2XZC9mjxsvcqa+VG4PAWWK0ZHzlqQfq69+2phnXV/kKBqOBzKl11BwhkdvpRzEFf0yzv+v6BaN48byI=
X-Received: by 2002:a17:906:5e52:: with SMTP id b18mr2608804eju.560.1634167092510;
 Wed, 13 Oct 2021 16:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
In-Reply-To: <20210922230947.1864357-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:18:01 +0200
Message-ID: <CACRpkdY+EQLA=2J2RTgw55WyDm_C0XhAH-0twXTArYGYyMNuww@mail.gmail.com>
Subject: Re: [PATCH 1/3] watchdog: ux500_wdt: Drop platform data
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 23, 2021 at 1:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> Drop the platform data passing from the PRCMU driver. This platform
> data was part of the ambition to support more SoCs, which in turn
> were never mass produced.
>
> Only a name remains of the MFD cell so switch to MFD_CELL_NAME().
>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Lee do you think you could ACK this patch so Guenther
can merge this series?

Yours,
Linus Walleij
