Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D678136F242
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Apr 2021 23:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237486AbhD2Vre (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Apr 2021 17:47:34 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:38597 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237299AbhD2Vrd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Apr 2021 17:47:33 -0400
Received: by mail-oi1-f178.google.com with SMTP id d25so30482681oij.5;
        Thu, 29 Apr 2021 14:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6G39G1xHQA9UdkOOBrGZrs5TTQa10r2qAl5rnu62VAg=;
        b=scQziS9990snOEiqSnnnTgpIz4kuVFfO2MNIvOxsQMIkT96Qvlyv4YDw5C3/zVdwmf
         pt+SVuwPLp9wMyGK/hFSKcmV11WhREWjDMx1vxfZrJLMMpMptOYwiHyUOESjn+/VpWKN
         NFTiRqS8cE/tdm2lSVDh2XxpTePsmsaVktlk9316VR34cS4StO/SJ9Ck+OZ+U//y3+UB
         fzsi7qtU4YujLUemmZpvlj8W51biv4bRF/ZRFz66Im5cLpYs4VaGAgMHU848ppH7xa4O
         Zw27etOBQgQNcJXiSA7/03Z/Rq/rLuHTCfPI/sY7KqUtGpirbl7hDYuvcfjzrnu59jpv
         Envg==
X-Gm-Message-State: AOAM533G5HlRr9hWOAHIJgkhf36fWA1UbwUdm/dqhDEpAUgHgTc2cEEd
        TYzeVtxpT3oxMjtNylHspw==
X-Google-Smtp-Source: ABdhPJz6DS0O37UozfkVTmi9KY8rpR2H+AZid6mjNopmy+3v+KVTMdbrNkKvueY2vCJmTd1xdVxyHQ==
X-Received: by 2002:aca:b05:: with SMTP id 5mr1534812oil.113.1619732805676;
        Thu, 29 Apr 2021 14:46:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k8sm265270oig.6.2021.04.29.14.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 14:46:44 -0700 (PDT)
Received: (nullmailer pid 1833518 invoked by uid 1000);
        Thu, 29 Apr 2021 21:46:43 -0000
Date:   Thu, 29 Apr 2021 16:46:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V9 2/2] doc: mtk-wdt: support pre-timeout when the bark
 irq is available
Message-ID: <20210429214643.GA1833375@robh.at.kernel.org>
References: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
 <1619315527-8171-3-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619315527-8171-3-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 25 Apr 2021 09:52:07 +0800, Wang Qing wrote:
> Add description of pre-timeout in mtk-wdt.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

