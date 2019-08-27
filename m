Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184B19DA57
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 02:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfH0AIO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Aug 2019 20:08:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43263 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfH0AIO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Aug 2019 20:08:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id k3so11546097pgb.10;
        Mon, 26 Aug 2019 17:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=op+KI7TlBsB6S6sFewOJ0t706uisxtkweddZPva/XUs=;
        b=RX9x+6DtGafaHO1iuCX95LpTQasZh6Epfv1c1WbVTDYTdGMgc1MTuuAunpoIXNNQhd
         dyvTNYlk5n1nkTqY721ASC09AaF3Jd2PeyOINmfcUce/x/U0YrVO2OGxhy1eJkkIdVcy
         TrypAKXyYIZgYBYIgWvMufNafmydykIbS4ktkSRekVFf1BscbukfP/gaj1ctYHrHIdI/
         W2Mu0iyEX6/umnjyUCn9Ad/wL0b0RAXM5UjjCAMWeg1lV/NxmqX4SSqS6TOZJnhVTtps
         aBxZY57njSC06peMlK8cO24ROLSbspHwy4OMMx2ogZIgS5YEKWUSUpoc/lhDEs5fUsfy
         oF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=op+KI7TlBsB6S6sFewOJ0t706uisxtkweddZPva/XUs=;
        b=dGN1RwPGW0ZZ6Z/3Xodq/LbksOlDLCJGVXP2EMQLik5UoFvp5fv/NYWKvnfaxOT31e
         C/eqswk1ttqqrsVi1Y8V8mTtFY5ZqWkUQ0pExNkSR0ML2HUgyPjgmeJy0WvYsj+5OH74
         UM4vX9yYc01JbzvNmg1dgxippFnLdcRSIFgZc97OnvuHtiXECp5m3QMQmY2QIvvDtjVq
         4G2adFp6gwlUmwFn+VZI4tz5qhRHQWf6lEhm6V0sEVq1x8l+NGFxJgemc5l1TA39LapH
         pn4xNo7kyuWiaWFgeMIxOavOJiY9rmJ5Iui1S6YilPADT+n9UeNSDCkbD7erqGO8CEwA
         6AKA==
X-Gm-Message-State: APjAAAX5d3x4/uke9q5awvBLOzOsb4KETHGX0KtI+2IWy9t7wEZBxZox
        953OifCcssBV9G08TCojd64zOUcv
X-Google-Smtp-Source: APXvYqyCOpJkfY8Cd0SdDE6aYRxO1Pg9WhbY61Aef8FokG+LaTjhPfxqLF8Bp0gzFOPMpKEYS54c7Q==
X-Received: by 2002:a62:7789:: with SMTP id s131mr23022125pfc.50.1566864493131;
        Mon, 26 Aug 2019 17:08:13 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id b126sm17923109pfb.110.2019.08.26.17.08.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 17:08:12 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] dt-bindings/watchdog: Add access_cs0 option for
 alt-boot
To:     Andrew Jeffery <andrew@aj.id.au>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Joel Stanley <joel@jms.id.au>, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-5-i.mikhaylov@yadro.com>
 <f33aa4b8-6d06-4226-8859-ce21a4b8728b@www.fastmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d040fee1-d12d-9ac9-a72a-e76137a4579f@roeck-us.net>
Date:   Mon, 26 Aug 2019 17:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f33aa4b8-6d06-4226-8859-ce21a4b8728b@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/26/19 4:57 PM, Andrew Jeffery wrote:
> 
> 
> On Mon, 26 Aug 2019, at 20:17, Ivan Mikhaylov wrote:
>> The option for the ast2400/2500 to get access to CS0 at runtime.
>>
>> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> index c5077a1f5cb3..023a9b578df6 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> @@ -34,6 +34,13 @@ Optional properties:
>>                   engine is responsible for this.
>>   
>>    - aspeed,alt-boot:    If property is present then boot from alternate
>> block.
>> +                       At alternate side 'access_cs0' sysfs file
>> provides:
> 
> Why are we talking about sysfs in the devicetree binding? This patch
> doesn't seem right to me.
> 

Correct; this is the wrong document. The attribute also will need
to be better explained. "At alternate side" does not explain (at
least not at all clearly enough) that the attribute only exists
if the system has booted from the alternate flash / block.

> Also if we're not supporting the aspeed,alt-boot property we should
> probably document it as deprecated rather than making it disappear,
> unless you're going to fix the systems that are using it.
> 
Sorry, you lost me here. Where is it made to disappear ?

Guenter
