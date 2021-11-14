Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D218044F7A9
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Nov 2021 12:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbhKNLoN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Nov 2021 06:44:13 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44179 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233656AbhKNLoF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Nov 2021 06:44:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id F0CF83200BF9;
        Sun, 14 Nov 2021 06:41:10 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Sun, 14 Nov 2021 06:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=5cl08X2+DCDlK2nOayAZZUJPZ4Sp
        r05TPDFj50fKBUk=; b=Hunl7HyBsvYIB3K4TYZPIUW7g4gBOe0Ej8WkUrs+0Hv/
        2RwSFokwZhS4X+95I9AtmTS68ZCzdaFwrOevkQ7EH0FBUVRa9ZBudNVviFIlv0YR
        3y7GPAowYt2bwkiHkB5jdk2O24tz1rldkpddOZmdyANmVT5Rq8ubH1lKC5B3TO44
        RAhrBAUlUB9OZ10/CIM+7lNNMXLozJ0q9k6LlKdvdmzfiFs0m8NlAlDizQKaHJLt
        u/m/4Me+o3r+/g/gh3K1zj7zK1103xmcQauqo5yXjyoiK342WR32kiKng5tV+yhs
        H2Ej0R+nmeSo38/FQbwUn+YtOyWCG1Sqmtd7WmzL7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5cl08X
        2+DCDlK2nOayAZZUJPZ4Spr05TPDFj50fKBUk=; b=Hl1S8to6mXq8ZJEBTWLzZz
        PIQs+o/RBA2+mLsh2vhbCnPPYv7ekf7V/ljJbQ7XfPbutQ7ZfUKpM03xH3IunmXZ
        NxI/61bFmi9YbFkY3+r8B5gruRp1tsKq5SfJJRN4Wo9oWGqykbA3bpunfN8/o9MF
        jPTUsutmdiB5UTkkarPQ3vUEc5PDwTck/i6w3eufyyf/onm9vdxNcs6oelVis7HW
        g6REl/ASPRsEdZoDh8aol+OSxc02VoaZ7mGyE0xf6Y7BT1cXPshzffZb2XKBJ+C4
        KLAkuYaEV6RAgLxLCWX0lTL9rbhpbAjz283xn32kZ+5Nus+MqUURv0+9adqn4ZBQ
        ==
X-ME-Sender: <xms:1fWQYdDrT6lezfOnKeHqihTUXVVecLV9jy2n5MTD0R4BZrE-awNrPQ>
    <xme:1fWQYbhjmvD-imumM1s4I4FPb_jTlauU9IaStRz8zbcA0vCDcwRNZUmrBMVoC3scU
    mmuxlymIqByziQEBiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhvvghn
    ucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhephedtffelvdffgeevjeeggedvueejtdetfefgleffhedttedukeettefhteek
    uedunecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgv
    rhdruggvvh
X-ME-Proxy: <xmx:1fWQYYkdVJysBJjAKfEV9__SfKdYdD-fJ-bMny1joY9T5MasKtAMLQ>
    <xmx:1fWQYXwViW8SrPeNl3kBQv_sqIGn3u-65GY5ffN20z4B-y-B72wx1g>
    <xmx:1fWQYSRSPzmEUFuQS7-mjNVUstVw2j3_6RI9xY0GiloIMJEkO2bOGQ>
    <xmx:1vWQYfRLxG2P3SE06gcVOiBSRJNHCG97H-RxcIWTwoQlMRPG-ud3yg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B9BA2274013E; Sun, 14 Nov 2021 06:41:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <fc541162-928c-4318-bc2a-06da0cbdf5e8@www.fastmail.com>
In-Reply-To: <d3cad37524f7debf@bloch.sibelius.xs4all.nl>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <d3cad37524f7debf@bloch.sibelius.xs4all.nl>
Date:   Sun, 14 Nov 2021 12:40:48 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Mark Kettenis" <mark.kettenis@xs4all.nl>
Cc:     "Rob Herring" <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add Apple Watchdog
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On Sat, Nov 13, 2021, at 22:07, Mark Kettenis wrote:
>> From: Sven Peter <sven@svenpeter.dev>
>> Date: Sat, 13 Nov 2021 10:47:31 +0100
>> 
>> Apple SoCs come with a simple embedded watchdog. This watchdog is also
>> required in order to reset the SoC.
>> 
>> Signed-off-by: Sven Peter <sven@svenpeter.dev>
>> ---
>>  .../bindings/watchdog/apple,wdt.yaml          | 52 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>> new file mode 100644
>> index 000000000000..e58c56a6fdf6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple SoC Watchdog
>> +
>> +allOf:
>> +  - $ref: "watchdog.yaml#"
>
> I believew this should be:
>
>   - $ref: /schemas/watchdog/watchdog.yaml#
>
> with that fixed:
>
> Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
>

Thanks for the review!
Almost all the other YAML watchdog bindings just use '$ref: "watchdog.yaml#"'.
Only arm,sp805.yaml uses '$ref: /schemas/watchdog/watchdog.yaml#'.


Sven
 
