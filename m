Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9578D1AB65F
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 05:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391526AbgDPDsR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 23:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729245AbgDPDsP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 23:48:15 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29086C061A0C;
        Wed, 15 Apr 2020 20:48:15 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i7so7550573edq.3;
        Wed, 15 Apr 2020 20:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DYpMfqz1zq603rQOEBVoeHDA0i7zRzLf7WtuMas81V0=;
        b=nbS0fnm2kL0TuWyAi2j92YFqSqLz+HfnG3IgHQj8GPxpp7u741zE35wyocrJn4HY23
         5s8tEPOfysRWq3EzaQGDouDfSnyxAsPKmrQEEI3MRTMQQrG9bq0y0vrGY0Bd5UIm+kSu
         JeLdRoIrFWsyy5b6u7P2CzFdIZ2mdZXZAMbfnLgPvpsM8UNabPf1+Tro+yD3q0xB8dWO
         4R8fAhNA4k85vPrN9Emcab0Zdd2Pu9jLhYjk/iXCUNuRLa0a2VNacLy67AVmCjPwUmAW
         XrjeuFqb3QzgAX3eJiFh0wwdx599gVN+qHfrF7nI9m4Y0Fk6eeAOLwAIuABj0puwFZCE
         LjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DYpMfqz1zq603rQOEBVoeHDA0i7zRzLf7WtuMas81V0=;
        b=WcJM8e1zOjur6tGBep2p1whzGRidb1JgOQbDYiIc0nYc5mdwKl4/Ghtnp8XLOUsT2x
         /gJnRewAI2OE8uS3JjrE5N1uFg70bkkbdYJVqXnbchIrlMNEcy91d8L9+mjyM3Qs4HYk
         PYe6h3PPSyUx+jVNhLTPHJ+Ce23aQHqeGCfyltaG7I/7yHNB9Aao8NyqaxM6IaBEzJ7L
         r3ZSclnU5/4qX9ZkHPccTyQOq2nnpz0J+dkdSTvwXPp0pk+FRZIRl+n9T3XY0nw7CRQL
         hnAIMS3195YRKq34CYrVG3LXi1KtYG6iE1AsLavqMca+pDfzRLAINzmiqBpVZs3qFKbq
         5R9Q==
X-Gm-Message-State: AGi0PuaqReCoUR6vMfj1CFnAG6lWrtU4nDEEFy3OegP63WVqxC4EXLJf
        O5gQcoKzLzMUwm2ET+zVzVU=
X-Google-Smtp-Source: APiQypIt7jQVi3Abg6f3mCTFeiI/2xzq/WIEpbJIuP2F9eKdtVCa6kXtTpUFZhSg0TzcsalgQy7FRg==
X-Received: by 2002:a05:6402:2208:: with SMTP id cq8mr4833460edb.293.1587008893775;
        Wed, 15 Apr 2020 20:48:13 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id c14sm2477020eds.79.2020.04.15.20.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 20:48:12 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To:     Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Will Deacon <will@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
 <20200415231215.GA182398@roeck-us.net>
 <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
 <CAODwPW9Vt7TcWfKYDmRgLndb2-+5HoNvA6XMJJznXCudQDngqw@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9d029a04-2a37-cbbe-1932-be34d34f6b69@gmail.com>
Date:   Wed, 15 Apr 2020 20:48:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAODwPW9Vt7TcWfKYDmRgLndb2-+5HoNvA6XMJJznXCudQDngqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 4/15/2020 5:56 PM, Julius Werner wrote:
>> Can anyone provide advice about making SMCWD_FUNC_ID a device tree
>> param directly, vs using the compatible to select from a table.
> 
> Sounds like most people prefer the way with using different compatible
> strings? (Personally I don't really care either way.)

The PSCI binding itself has provision for specifying function IDs for 
different functions, and this seems to be followed by other subsystems 
as well like SCMI:

https://www.spinics.net/lists/arm-kernel/msg791270.html

I could easily imagine that a firmware would provide two functions IDs 
(one for AArch32, one for AArch64) and that it could change those over 
time while not changing the compatible string at all.
-- 
Florian
