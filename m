Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455B93F2582
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Aug 2021 06:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhHTEFf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Aug 2021 00:05:35 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:47489 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229457AbhHTEFf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Aug 2021 00:05:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 16E592B01222;
        Fri, 20 Aug 2021 00:04:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 20 Aug 2021 00:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=b
        9n8FHHgB7n5u9D8RC9mb2DdWFB5BNJvEHs32+cU4qs=; b=qJqaqGL6pvo9EXe29
        js30k3msoz5yqpOxMzJvXJuXPP77IcK/QYEgNX3wJcmy+B3uAxBOKL/Dmu+qb5Hs
        IgjrI7z7H0xm4fJmhosRB09ZvRYrSSZXy5APwYbH9Ucz4GBdCdvuY2qbp8yYXATn
        CeIA1AHUc3mxaVpwzcG0dU6MxPR+/lpwIaB3asF5NkotSKtNQLyCjgMJ6gLLSyaH
        JYC2mAvz/Xcv4HBr64DKcR49+ky0y4SOPeaO5KyL82NhRcXMwNGFDDwf2aNO2MOR
        he5+FywrmsDx83NSj0H1T3YSq1Cn/N072quKKxbXyltlsBOI6g0WWn8buoAU1/is
        MCkHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=b9n8FHHgB7n5u9D8RC9mb2DdWFB5BNJvEHs32+cU4
        qs=; b=GQv/zb2BvjDnXsLzad63nSdXBfCS0IXLUfgfmJNtsxlhY3HG9OdBXrRCy
        mX94NHVXw/YiBUE3IokZEpLa3b/IsBz6LF42nSEQqZZEyPisIkSYIKifbRE8Gs7w
        fR3UtoGKMfnNbm69bxOzFZ4JmgW9JiPuVxVLgJPZo0nlw8WBgLyUvZZa5nT+tx3s
        Bckvg/0zNxJmhd+f9fMjOacU31SoH4x5m7PAAZmimpmympXGpAX3NlHpP9NY7F5S
        NsW4nFgwL1ci5mOyZDkw1bLMrEAbqLfZwWWx3Q9z8eAUwJ8ot+K7WthrDphOqc94
        +DXctOpPMWp9n6iTD5meB0vQQM5wg==
X-ME-Sender: <xms:5ikfYYsxSEmzEnuJqa8Y2AcqufbUWw_4Hk2gSPVwTDjI1W0Uz-ekiQ>
    <xme:5ikfYVcWWo6vhP2OyMhnmCc-QVw8-AfN2zJgESSgAnusL7n8JFGWI5xeuL4svgzbr
    xe1Pm4IF-3fbnDLwg>
X-ME-Received: <xmr:5ikfYTwFAo6QvXPHHKDsOL43o2UuyN3XI9KWcYy3DQgnDZlCFUZMnioMJnD-q3JSnM_8bevMG_sng0MTErMHDD-fOoAZaqA0rQBEiUfgQfn3AZyLAZS3hTOxTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleekgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5ikfYbOOw2ep0wGByRHzma11LZDXi9zLrlUuKzfIBpcWauOoVmJn7A>
    <xmx:5ikfYY9YwOPZlh4-PErgUOehQ-Mybq-_OjKijqkdJQt5Kna0Wl2YUA>
    <xmx:5ikfYTXLMO_lSu8q9lkyXvLTURMHYPnIyMyJ9ptNC_8XkN4m5i53KQ>
    <xmx:6CkfYTbC9cXYJ-vHOpchVNp1H6hwRtOu9GvTL8h4RpExaBRT2XTA3Wmb79Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Aug 2021 00:04:53 -0400 (EDT)
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: sunxi: Add compatible for
 R329
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210805045716.46141-1-samuel@sholland.org>
 <20210818090732.wdickyw67oc4zqpt@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <791b7548-cd7b-6cdf-8364-671f6a2029a9@sholland.org>
Date:   Thu, 19 Aug 2021 23:04:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210818090732.wdickyw67oc4zqpt@gilmour>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/18/21 4:07 AM, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Aug 04, 2021 at 11:57:14PM -0500, Samuel Holland wrote:
>> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
>> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
>> an alternative clock source, with a bit to switch between them.
>>
>> Since 24 MHz / 750 == 32 kHz, not 32.768 kHz, the hardware adjusts the
>> cycle counts to keep the timeouts independent of the clock source. This
>> keeps the programming interface backward-compatible.
>>
>> R329 also adds two new registers, to allow software to immediately drive
>> the SoC reset signal.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>> Changes v1 to v2:
>>  - Switch from enum to const
>>  - Add descriptions to "clocks" items
>>
>>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 32 ++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>> index 9aa3c313c49f..8fa5b0d32381 100644
>> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>> @@ -24,6 +24,7 @@ properties:
>>                - allwinner,sun50i-a100-wdt
>>                - allwinner,sun50i-h6-wdt
>>                - allwinner,sun50i-h616-wdt
>> +              - allwinner,sun50i-r329-wdt
>>            - const: allwinner,sun6i-a31-wdt
>>        - items:
>>            - const: allwinner,suniv-f1c100s-wdt
>> @@ -33,7 +34,18 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      - description: High-frequency oscillator input, divided internally
>> +      - description: Low-frequency oscillator input, only found on some variants
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      - const: hosc
>> +      - const: losc
>>  
>>    interrupts:
>>      maxItems: 1
>> @@ -44,6 +56,24 @@ required:
>>    - clocks
>>    - interrupts
>>  
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - allwinner,sun50i-r329-wdt
>> +
>> +then:
>> +  properties:
>> +    clocks:
>> +      minItems: 2
>> +
>> +    clock-names:
>> +      minItems: 2
>> +
>> +  required:
>> +    - clock-names
>> +
> 
> We should also make sure through an else clause that all the other SoCs
> have a length of one for both clocks and clock-names

Yes, I'll do that for v3.

> Also, it looks like you forgot the patch to enable the compatible in the
> driver?

R329 has a fallback to A31, so it doesn't need any changes to the driver.

Regards,
Samuel
