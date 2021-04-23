Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31BB369890
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 19:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhDWRkC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Apr 2021 13:40:02 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:41509 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbhDWRkB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Apr 2021 13:40:01 -0400
Received: by mail-oo1-f50.google.com with SMTP id d16-20020a4a3c100000b02901f0590a614eso3017531ooa.8;
        Fri, 23 Apr 2021 10:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sGjhlhtLBObGLd+1LCyQnr489UoVKc66rsGAgizXgdA=;
        b=XoWpnPj3RMHhDKn9aHkV+YQSz/BjMTnmAzlrMBFKXYyyVB/0FuLAJZC95BalScab/8
         +6JS0MxbCjgLoKEKh5PtX/bzD/55wIMp+EU359YZ5J/FDtpSrkKTDxdLwQ8fwtDmHOxN
         OeixdTJcLhd7T09ShcSJOgMc5ic48iclBWzn0prBSfCT6ZBPawmH6YE128lZycwuhrfj
         KTTbGRTL6M0buDt5yevhOsA4FUKneS/57LXhiVT42TsOOAZLWKis4C/UbIZ+F3lUiwdJ
         sQAU8QSMGsC/vZcwOeXaIW+jNHLOyhzVHJYIVH3G3yZhSTzXQDFGc2lhNJCjCcAPF2iv
         eB6A==
X-Gm-Message-State: AOAM530YjVxCpK75cSxOz9jIc29hApygihSAwvS+HZ+T5coPEwXNiKnw
        BbqSVu5FOOYphTtjQaMgVaY9gpMnUw==
X-Google-Smtp-Source: ABdhPJy5iKKa2NKC7L22NHljOcFkozW6mDcypQA5M62c2D/DIZ38rv/lwTl5CYBmNwkQRaOpZl+scQ==
X-Received: by 2002:a4a:d513:: with SMTP id m19mr3825953oos.92.1619199564685;
        Fri, 23 Apr 2021 10:39:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e2sm1506515otk.70.2021.04.23.10.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:39:23 -0700 (PDT)
Received: (nullmailer pid 1308565 invoked by uid 1000);
        Fri, 23 Apr 2021 17:39:22 -0000
Date:   Fri, 23 Apr 2021 12:39:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V7, RESEND 2/2] doc: mtk-wdt: support pre-timeout when
 the bark irq is available
Message-ID: <20210423173922.GA1308513@robh.at.kernel.org>
References: <1619148020-2236-1-git-send-email-wangqing@vivo.com>
 <1619148020-2236-3-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619148020-2236-3-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 23 Apr 2021 11:20:20 +0800, Wang Qing wrote:
> Add description of pre-timeout in mtk-wdt.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
