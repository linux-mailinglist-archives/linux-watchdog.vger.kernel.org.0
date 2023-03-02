Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 914926A7D01
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Mar 2023 09:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjCBIpY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Mar 2023 03:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjCBIpX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Mar 2023 03:45:23 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FDA9759;
        Thu,  2 Mar 2023 00:45:22 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id p13-20020a9d744d000000b0069438f0db7eso1142741otk.3;
        Thu, 02 Mar 2023 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677746722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zv4sf3w8etFyEYoNwViwcM8FYGBIJMdZlId23ZnUOvg=;
        b=W8GHgTds7Tg+RtBtPgb/ma2nsLJqbJyyJ/colCLHs24b+js4Ok2SiTfE1TJr5ax9Ma
         oGsyOt7i1V9YX49Ba2g8L4CsQfgDit34DNvoAG0JEaxGem8Ro9zIgZcUVrq/IrGzwOqz
         zokndbDmzpEice39tM3WLmQZ0aPFo5JsickpkU3f+D+k5cLt2Yw9ZEdDvCrtdIxYqHGG
         LPv08RXLpJQs08vHC2HtV4wiHy8mCM7Mn2G72QvU9tL+aNwM1EM61OuXTPrXyRgSyGdC
         S2y34baDCIYscePq4FIFpn/PWW2m7Vjm11HC5BTxEPYFkAfXOM2sqc8159CwgX8hvYoM
         DPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677746722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv4sf3w8etFyEYoNwViwcM8FYGBIJMdZlId23ZnUOvg=;
        b=JiKb5Wae5vRnf7EqzO3TpidmVofUZFntQllhwSo0d7jX+Q3U3nEPlsuESS8uStk1q/
         6L4HxGCR1t15j5sDxzvNSSI54NlqXLTK4xNEG+EMCM6r2WUt6POF6EmWTlWiG0MRtFoB
         FWxN9HpLP5bZ7/sduA8SX50flZWE+WTAxv6JMgPTlJQx0A87UPNo5DfdbBUVZdi48Mg9
         nbKtPe2Kq7iRD/ljE7VOhmZxhDL2otoft6Bmef8JFx1FHE4k5cQL/7rCMQ4grcWZfaN1
         pTZmq9xRcbokeCWTwTV0MwOVun1fnFX7fckGoQuv2AMKB5xuU4GWTn0KGv+VCjq6LxGD
         Jcgw==
X-Gm-Message-State: AO0yUKVou7GSmZIsbkIWPFCP9lPtcdk/ezWNzYClbhSvS567u7ds+4mo
        LLmAggNPbZeKz4asfIXS+Qba1n7bOTJ2OR0LWTe7ngIa5ic=
X-Google-Smtp-Source: AK7set/9DcayqnWPACOCTpKcbPsJ5U+WF0f405fnF2KvVUuZjoIcMmHpS8TVYLCeJgdqQZUuXp+puONOC3oRLYUQiBg=
X-Received: by 2002:a05:6830:716:b0:68b:d5dc:7806 with SMTP id
 y22-20020a056830071600b0068bd5dc7806mr3142682ots.6.1677746721905; Thu, 02 Mar
 2023 00:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20230301091957.2824172-1-sergio.paracuellos@gmail.com> <d6bf51f9-ef5e-910a-1b75-7c168746dd5c@linaro.org>
In-Reply-To: <d6bf51f9-ef5e-910a-1b75-7c168746dd5c@linaro.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 2 Mar 2023 09:45:09 +0100
Message-ID: <CAMhs-H9-LB-R8bD-z+j9=7zstjhgTK6khr_ygYJUvWKj5FtGyg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: migrate rt2880 text bindings to YAML
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Krzysztof,

On Thu, Mar 2, 2023 at 9:22 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/03/2023 10:19, Sergio Paracuellos wrote:
> > Ralink RT2880 Watchdog bindings used text format, so migrate them to YAML.
> > There are some additions to the binding that were not in the original
> > txt file. This binding is used in RT2880, RT3050, RT3352, RT3883, RT5350,
> > and MT7620 SoCs. To properly match all dts nodes included in openWRT git
> > trees we need to add to the schema 'reset' and 'reset-names'. 'reset-names'
>
> Sorry, but out of tree undocumented properties cannot be added just
> "because they exist". Otherwise what would be the point of
> documentation? It would be enough to add any stuff anywhere and claim -
> it's used in my xxxyyyzzz, so we must support it".

Pretty clear, thanks. Will re-do this commit message, then in v3.

>
> > property is always string 'wdt' so maintain that as const in the schema.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/watchdog/ralink,rt2880-wdt.yaml  | 47 +++++++++++++++++++
> >  .../bindings/watchdog/rt2880-wdt.txt          | 18 -------
> >  2 files changed, 47 insertions(+), 18 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> > new file mode 100644
> > index 000000000000..c96bf2e61364
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/ralink,rt2880-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ralink Watchdog Timers
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ralink,rt2880-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: wdt
>
> Drop reset names.

Will do.

>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
>
> unevaluatedProperties instead, because you want properties from
> watchdog.yaml.

Sure, thanks.

>
>
>
> Best regards,
> Krzysztof
>

Best regards,
    Sergio Paracuellos
