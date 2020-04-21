Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E7B1B1BFC
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 04:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgDUChL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Apr 2020 22:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725829AbgDUChL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Apr 2020 22:37:11 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD60C061A0E;
        Mon, 20 Apr 2020 19:37:09 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id s10so9100074edy.9;
        Mon, 20 Apr 2020 19:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wfjIAKV3CzN2ahQVF5QQ7qnHBO9rsV9xDFuglbIYlvo=;
        b=ePqxLPQpEgCKHMylYI58HlD8/cm9VNW5FPOSETx1OcR1+SmzgCaSSbuvVi8em6SgPX
         /vk71YJnaBWoVN2KWdJFcQdLMlp8QaPEtL3XT2g0Ha/t7jMhHlptiTsxMjJ73sv8AULl
         TGkfouaOnEYkzihEu2Ln6B+0iQvN1VeXhWja7oz8lJ+Iy2N+UI34KCG6N4SufASF1BbH
         QqjJm+G6nJh+nUAZ/oKJS8B7ncIwR5sim9M+/BeODFxTxk+L7Orff90XH53EmdYlYFuG
         TsYPZLcWIp6Ycoiw9Nc8z/1Wn/rkDaOD0m6DTWWse67H2GwP3U50UsqXUqlpWW+N2Nbg
         0k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wfjIAKV3CzN2ahQVF5QQ7qnHBO9rsV9xDFuglbIYlvo=;
        b=G548z2qt7PHu5W9634A0UI73udffUCRx/Hg2bIuLiRKpaX+zuH/f8lH+NCumU4uNz7
         lZQD3eaO9H/7lMdSQnT7bTPMqVbd2noX6CvDWqRCpLLJTsdgsxkAHK8g3XSEbioJPvIh
         HBdZuycCLsoC+ghdHWB21NawPp+FC+k1m7S81tSH+8Z3FIPfBp5vFMSMCX5n1pMe0SZl
         be3ZPwBCeumw7+QpWmA1Wh/B0UQAiwu3AxNbIs1ZeNJB2tBwKp6Hqp3KMQPk1IWnMxjk
         fFb4/Mb4s0TDfpYzfSjxQwPPDpcZzb4M/9yhBod5pxVda5ABmr6U45oYWSBkzdWMBsmq
         kpxw==
X-Gm-Message-State: AGi0PuaXAtC3TQWKMjw/IOyNrfLEi/JrVJRZ17rg+2ck/kjC7TdQwHRB
        3XYKB8MgCKNe61fwjkwb+nc5WW9b
X-Google-Smtp-Source: APiQypJhXdwWOerhgYAN5dOVFSby+3Mbee+FNPtzk+Uk3eZXjRSCcip4tP0F0bwdHDDzezV9TrpUdA==
X-Received: by 2002:a50:b263:: with SMTP id o90mr16161876edd.326.1587436628433;
        Mon, 20 Apr 2020 19:37:08 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id z18sm253309ejl.37.2020.04.20.19.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 19:37:07 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To:     Evan Benn <evanbenn@chromium.org>
Cc:     Julius Werner <jwerner@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
 <9d029a04-2a37-cbbe-1932-be34d34f6b69@gmail.com>
 <CAKz_xw33YBChSCDHcki2JCR=LXrvfEN2pseEN471xVvqhqrUfA@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d1fe9a51-d180-a4f4-7af4-b8edbf3c6f29@gmail.com>
Date:   Mon, 20 Apr 2020 19:36:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKz_xw33YBChSCDHcki2JCR=LXrvfEN2pseEN471xVvqhqrUfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 4/20/2020 6:08 PM, Evan Benn wrote:
> Thanks Florian,
> 
>> The PSCI binding itself has provision for specifying function IDs for
>> different functions, and this seems to be followed by other subsystems
>> as well like SCMI:
>>
>> https://www.spinics.net/lists/arm-kernel/msg791270.html
> 
> Are you referring to this line in the devicetree linked?
> 
> +- arm,smc-id : SMC id required when using smc or hvc transports
> 
> I cannot find any prior definition of this in the devicetree yaml
> format, so I will add that as well.
> Did you have a link for the psci usage that you referenced?

Sure, line 80 and below from psci.yaml:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/psci.yaml#n80
-- 
Florian
