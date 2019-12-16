Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98A13120731
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2019 14:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfLPNaM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Dec 2019 08:30:12 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35324 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbfLPNaM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Dec 2019 08:30:12 -0500
Received: by mail-pj1-f65.google.com with SMTP id w23so2992713pjd.2;
        Mon, 16 Dec 2019 05:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c6k2uM/4KQBTBeEC+JGE88itWoiZaxFzfzDFaOUPwN4=;
        b=WU2LMml9ybURvvoAkKn84Ls2pu5xuXxxs5xMy9YIAIuH+QpEBES7Fx3AEg2Awx0eZC
         eOP9lj+obKAHaeQTG8x7AKkZRmJVsKhTCrmDoU+lTu4fD7hbjbbB0TDh8anWmiR4NE8Q
         0vRnJFCI88IlQ/i2lgF5OkFvvmdA4xSVQw46d82pfn1UYopKvLJdYUDFZEOie4D29ofs
         jhr83+VsoL5WyjrRsBkdTtIISTH1IF0nFzXfQYAZkctwUem7bQamJ24XBDBIj+xvPmhA
         AGv5C2QbcM9PBGJxMstdHAuE0iPKFOisBpolMprqccxSmygVz+ynNZOFYWIQiWOsIKW0
         X9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c6k2uM/4KQBTBeEC+JGE88itWoiZaxFzfzDFaOUPwN4=;
        b=elD5O4Z7FQ4hGHLyDNuTWJH3MA1bZd96RVOwgDO9dL2L6UuzsZ6mjGZJuICjGl/Loy
         GyUPcmwBIr8uW0shDph5qvfanTHKh8/lOmslXzZx1ZU6bGPziq3y/m21TCHMhdoPuYmP
         t7n6T9CHf9JuEfwhtrnhzLoulwcMoirdzI1x0bFdtlaLYLRDtrfKh38b/Sqn2Yu8noRX
         UwgFbwKCfX8Xv/8K9nBXwyyFLATgXCJs33IwQjD2sXnH6LSpP7mLJDSVHB/k6MPWX5Pk
         B1DlgtDGJtRjFDHFaiR5xQufLvFaKnrmLM/3733ECMxDOSYFjTqn7JT5QAHhlsKpJk6x
         /C2w==
X-Gm-Message-State: APjAAAVbaOrV3ZStzPTmW/8n4PvLr5AnYsA4l9v6vlYUlffrNcQnXsUi
        ZkbJkCmAiIu7iejuU8o2+bE=
X-Google-Smtp-Source: APXvYqyJ6TZHpyv2Kz7CGI3OHria7rp9vvxislgxfsCZuO3kdTuBGJfZKrdme0Kw7m9+Qlmwh7TBjw==
X-Received: by 2002:a17:902:d915:: with SMTP id c21mr15807890plz.295.1576503011717;
        Mon, 16 Dec 2019 05:30:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13sm5365907pfi.78.2019.12.16.05.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 05:30:10 -0800 (PST)
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
 <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
 <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
 <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a8f5ab1d-264c-5b2c-e72b-3774b9f44c22@roeck-us.net>
Date:   Mon, 16 Dec 2019 05:30:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/15/19 10:03 PM, Xingyu Chen wrote:
> Hi, Martin
> 
> Sorry for the late reply.
> 
> On 2019/12/13 4:05, Martin Blumenstingl wrote:
>> Hi Xingyu and Rob,
>>
>> On Thu, Dec 12, 2019 at 1:20 PM Xingyu Chen <xingyu.chen@amlogic.com> wrote:
>> [...]
>>> +examples:
>>> +  - |
>>> +    watchdog {
>>> +          compatible = "amlogic,meson-sec-wdt";
>>> +          timeout-sec = <60>;
>>> +    };
>> in v3 of this patch Rob commented that there shouldn't be an OF node
>> if there are no additional properties
>> with timeout-sec there's now an additional property so my
>> understanding is that it's fine to have an OF node
> Your understanding is correct.
>>
>> what I don't understand yet is where this node should be placed.
>> is it supposed to be a child node of the secure monitor node (for
>> which we already have a binding here:
>> Documentation/devicetree/bindings/firmware/meson/meson_sm.txt) or
>> where else would we place it inside the .dts?
> IMO,  Although the watchdog node need to reference the meson_sm node, there is no
> bus-like dependencies between the devices which the two nodes corresponding to.
> so i think that the watchdog node as child node of meson_sm maybe not appropriate.

The watchdog driver needs the meson SM's dt node, and it depends on the existence
of that node. That seems enough of a relationship to warrant having it as child note.

Guenter
