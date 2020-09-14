Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29508268FDC
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Sep 2020 17:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgINP06 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Sep 2020 11:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgINP0q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Sep 2020 11:26:46 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABAEC06178A;
        Mon, 14 Sep 2020 08:26:46 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id m7so321173oie.0;
        Mon, 14 Sep 2020 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=43Mo2cDCJQk1bbidqAAmRcOmWVTocCMpFsO0wzwgtfU=;
        b=Wj09zd+LrzMhQxCDjshlAMV6t1w7Rkdf0ywVbMErtypJg88Tnmm0ox2cL54MuraIQm
         xlQxTFS0oHj3PnDZjiAimlYycVfSSnG9TC8yH9drsLXANlVj6P1oPiRnB8mLiHR9tcpU
         gQPanlF8Hr2t05MmAJrikUq/84tyZdDW09yKQDWRuPKFTyQuwQHc3yyvpUv0CuK4REbR
         xTRBDoGQ2nCqKXv9bHgupSx8DQ1IwBX8X1SxvYFxvZyp+V44qsPhCx7HfVCJUb3H8i9q
         8pwrY1YFa/gCPBB1w+OBkjzGdZyaL+B84BcWuUh31d+1iohjVt/8n4xLzKxjGh2LprZW
         m6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=43Mo2cDCJQk1bbidqAAmRcOmWVTocCMpFsO0wzwgtfU=;
        b=uY/IoxYx/Yr2a1c2JAOoeZYY7URyjrJ0j7EP+GnnkG5rSyZihafpWX57gJ5pdmAwS/
         eQw/MvUS8MXyrq+6otuqtRFswjrNWWR6zkoC8UdL4kBaoL608IZJirPXy7CY3Enn74fl
         8Ps/Xn6MWUtVrsqetiYaadqYGMj4qCVfgGmRxBr6hy4awilcOAfgH8w0KjgBsBTWgpfx
         NJ7kNGj8R5chI69mjqLMKecnC6bMu2Zpn/gVwCl2sryW7Q8AQ4AFEhLeiKezlzEBc4wJ
         O4Q7h6Nrbp/aQyk4piF9/dWC803YeSBXyzWaYe+RmfoE7Xd33bht6E5OjOr2OCCb5KF/
         FtyA==
X-Gm-Message-State: AOAM533YkyDI6Nm53EvpKyz+jgF81R0D//e/+GR3NXEoRz2HdiSD4pkz
        Fvqlktza6QQIznI4pa1lYb8=
X-Google-Smtp-Source: ABdhPJyrIlzIPp2/8/eTxGNpxg7QwI6VdCEtTRsuyhm8l5bxu8DpAw+V/AZ1oQpVlsIj8g77iZ0VrQ==
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr9326940oig.114.1600097205618;
        Mon, 14 Sep 2020 08:26:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c15sm3772166oiy.13.2020.09.14.08.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 08:26:45 -0700 (PDT)
Subject: Re: [v4,0/5] watchdog: mt8192: add wdt support
To:     Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        Crystal Guo <crystal.guo@mediatek.com>
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
 <CANMq1KA=t8srKfC4XUqk2V2N6Jm0=-P4rQSh9Mqbo2tFFKgTEA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e74681e5-640c-5e5f-5daf-e22ed9b2594e@roeck-us.net>
Date:   Mon, 14 Sep 2020 08:26:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KA=t8srKfC4XUqk2V2N6Jm0=-P4rQSh9Mqbo2tFFKgTEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/10/20 8:26 PM, Nicolas Boichat wrote:
> Matthias, Guenter,
> 
> These patches have all been reviewed (apart from fairly trivial 2/5),
> which maintainer should be picking those up?
> 

I don't see an Acked-by or Reviewed-by from a DT maintainer.
We'll have to wait for feedback from Rob.

Thanks,
Guenter

> Thanks!
> 
> On Mon, Aug 3, 2020 at 3:15 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>>
>> v4 changes:
>> revise commit messages.
>>
>> v3 changes:
>> https://patchwork.kernel.org/patch/11692731/
>> https://patchwork.kernel.org/patch/11692767/
>> https://patchwork.kernel.org/patch/11692729/
>> https://patchwork.kernel.org/patch/11692771/
>> https://patchwork.kernel.org/patch/11692733/
>>
>> Crystal Guo (5):
>>   dt-binding: mediatek: watchdog: fix the description of compatible
>>   arm64: dts: mt8183: update watchdog device node
>>   dt-binding: mediatek: mt8192: update mtk-wdt document
>>   dt-binding: mt8192: add toprgu reset-controller head file
>>   watchdog: mt8192: add wdt support
>>
>>  .../devicetree/bindings/watchdog/mtk-wdt.txt  |  5 ++--
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  3 +-
>>  drivers/watchdog/mtk_wdt.c                    |  6 ++++
>>  .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
>>  4 files changed, 40 insertions(+), 4 deletions(-)
>>  create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
>>
>>

