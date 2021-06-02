Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA58D3986CE
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jun 2021 12:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhFBKrg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Jun 2021 06:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhFBKrf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Jun 2021 06:47:35 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A698C061574;
        Wed,  2 Jun 2021 03:45:51 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id b25so2269686oic.0;
        Wed, 02 Jun 2021 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eXKINWXa0bjDJgK/ywcDJ+ojBskVf7ukQn1t5GiFFaw=;
        b=oYoulyT2rIcq8A0JTUO9ReBCmTJkNP3CqX8WVjoCNT3Qtwnk5oabTdyWlfx5x9ObsX
         N5BNsuUqJlBh3SszN5WaVb20Fj87IYi71bU53qQR1UfajYxaiNmqTFA50Oa4Ki6v5EWn
         eB6+BFqK+mmbA2NxIANCxSfzS43btbRXSFEAN4/JQbK+vLXAG1TVnOM1YSjhLGOWOkmt
         SkQvUALu1rlUQvd60ar9nY0fKXJR37Dgt31klarABjmfA8y1bDIMoDSUa+jRxIeX9xvx
         WBfpk6fA0jj8dFKRi6EpjYG5R2QnlNEPqfSwM6Y4KUKdBTTazcQMUleaT9gPzZP+u9H4
         amGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=eXKINWXa0bjDJgK/ywcDJ+ojBskVf7ukQn1t5GiFFaw=;
        b=NQYjKX9i71ku71V1l8SFUm7F6RdFBKnqtaHC4hAi3pw/KRYr1jkl3eb304f0RXpiXM
         mwpZ3VhU748lkk3ElQcFsrjiKBYOPlwpVj5HJGKIwuR7nsYY9OVVsGXdP6ikNg17j9Xp
         eIsaVAQoxOq4t/e8H0N4k+cKhxHrW/vcO5JOOCJ0NWplriHbLWtYl7hZzoRupdg4jDvK
         O9XXrfpYOHgJVZZxWjSdzHKF+rFnh8+YXIe1zmtKfUxqSsn2w2L6wT0jGAsvm0prMkmu
         YgVWXwqdYOo/jT+44m+9t2+k67OfCyizeYIbO2IEPXjxkXqZz9Hnt9b+iU/qyoz0qJ/v
         mIUA==
X-Gm-Message-State: AOAM5308E9DkJr/N9bdRwAMCyGcdccuyHqd6iPLIiP9qz483Y+xdm34v
        o0MEMNC4W78ATftarPgTeaU=
X-Google-Smtp-Source: ABdhPJwc6PM8HlyjkbWQi5wLaodwmu3gvioqwFls2B3zprH7RHff/PIsMDTLIl4iHpOVzLqTImUA/A==
X-Received: by 2002:aca:2b17:: with SMTP id i23mr21517722oik.87.1622630750364;
        Wed, 02 Jun 2021 03:45:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1sm3922934oos.32.2021.06.02.03.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:45:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 03:45:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9,RESEND,0/2] watchdog: mtk: support pre-timeout when
 the bark irq is available
Message-ID: <20210602104548.GC1865238@roeck-us.net>
References: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 31, 2021 at 09:51:33AM +0800, Wang Qing wrote:
> Use the bark interrupt as the pretimeout notifier if available.
> The pretimeout notification shall occur at timeout-sec/2.
> 
> Wang Qing (2):
>   watchdog: mtk: support pre-timeout when the bark irq is available
>   doc: mtk-wdt: support pre-timeout when the bark irq is available
> 
>  .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++
>  drivers/watchdog/mtk_wdt.c                         | 77 ++++++++++++++++++++--
>  2 files changed, 77 insertions(+), 5 deletions(-)
> 

The series is already included in my watchdog-next branch, making this just
noise. On top of that, it is v2 without change log, meaning I have no idea
what changed since v1 and if it is different to the version I queued.
If it wasn't queued already, you'd get a message telling you to resubmit
with change log. As it is, I'll keep my version and drop this one.
Wim to decide what to do with it.

Guenter
