Return-Path: <linux-watchdog+bounces-15-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB87F34B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 18:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233D228263B
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 17:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15F45A0F3;
	Tue, 21 Nov 2023 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkJZIIwl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC5F1A2
	for <linux-watchdog@vger.kernel.org>; Tue, 21 Nov 2023 09:15:54 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ce2cf67be2so3104951a34.2
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Nov 2023 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700586954; x=1701191754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYvL1f6qyMgF9ZLkQm7l0/EVu68jtasrXI+WCiFQL18=;
        b=JkJZIIwlJLGcST/3MOrJehs9ttmqnNyViL5GOOaKM6TFfvs00iwIqFia/W6pnU38o2
         Nvb0+TSm39OyoIdeWPqf40cOHk3rb47YAlS42uq4mD3RCMji5seP0rlZEmBp4StPA2tU
         1klr15Im50/btN0thcoNO1pM52OXDWUCMiu/qKyuLji7Lyr0VLY/r0d0i/jnqz3fZCf0
         ZhbbvCmV8pwzyE7sT6NZ9pk6e6qWzMNVwMOW6V2hpKz0roq/6R6fFRGZ0VFWUAkklAji
         tc2ClALHXnvm6VuJ5I068xkooIz2+UUaKQmtaTrMaTtlzLhKszkaezGNt97vGojQ4Atf
         4lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586954; x=1701191754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYvL1f6qyMgF9ZLkQm7l0/EVu68jtasrXI+WCiFQL18=;
        b=HeIGlfXVVLCT9GKbpYo036elbTfl11np84JXb9mt+1fGxAWvPSYHExBjdyZ3mm0nnj
         KP1/thbOpRppXl/EkOtblQd6pgUDLKE/qKXrd5/giGyWQl4C21kBAHVlNybIXiBlw0yP
         eXxj0Ty1RLDPTCZx7pFBPzhjUBzYwTpQIrO2eFNFhkxihc7ifvrzMfEgJeQKjjgdwF/S
         B06X9w8hU/hKUMpLaIJfwufRouahN9Ds8i+GHJLRr5Jp4nA7n1JkmciwkqAh3+V+uAqZ
         b1vhA6KeQMXINM//e3M0hunB/+bP1HPlqbeiVvZ58W1Rw50Xd46waNzkZCZPc6Py5U4U
         HzlA==
X-Gm-Message-State: AOJu0YyVUzAkJmHn1Ae8ExRRxUDixpBMq+/fPyFkiIGbguPZcCVwwM8H
	pdJ1kdInAOkTj8oDZcORA2puQUGszupkYC4K7aHYLA==
X-Google-Smtp-Source: AGHT+IE1Yjlr5gsSZr73YBwrAm/JguEA+8gBotneRznXIDcM0Spz8+slB43K4KERP5aFOuw7iXwJdfOtIrJBVa4sOBQ=
X-Received: by 2002:a05:6830:1da4:b0:6b8:807b:b50 with SMTP id
 z4-20020a0568301da400b006b8807b0b50mr13016366oti.22.1700586954278; Tue, 21
 Nov 2023 09:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org> <20231121151630.GA1692178-robh@kernel.org>
In-Reply-To: <20231121151630.GA1692178-robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Nov 2023 17:15:42 +0000
Message-ID: <CADrjBPo4qw4eJLuGsv7aK4V7QjGR_n_MQ+W-Rrq92iATSLFHZQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Rob Herring <robh@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your review.

On Tue, 21 Nov 2023 at 15:16, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Nov 20, 2023 at 09:20:27PM +0000, Peter Griffin wrote:
> > Specifying samsung,uart-fifosize in both DT and driver static data is error
> > prone and relies on driver probe order and dt aliases to be correct.
> >
> > Additionally on many Exynos platforms these are (USI) universal serial
> > interfaces which can be uart, spi or i2c, so it can change per board.
> >
> > For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> > required property. For these platforms fifosize now *only* comes from DT.
> >
> > It is hoped other Exynos platforms will also switch over time.
>
> Then allow the property on them.

Not sure I fully understand your comment. Can you elaborate? Do you
mean leave the 'samsung,uart-fifosize' as an optional property like it
is currently even for the platforms that now require it to be present
to function correctly?

I deliberately restricted the yaml change to only require this
property for the SoCs that already set the 'samsung,uart-fifosize'  dt
property. As setting the property and having the driver use what is
specified in DT also requires a corresponding driver update (otherwise
fifosize gets overwritten by the driver static data, and then becomes
dependent on probe order, dt aliases etc). The rationale was drivers
'opt in' and add themselves to the compatibles in this patch as they
migrate away from obtaining fifo size from driver static data to
obtaining it from DT.

>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index ccc3626779d9..22a1edadc4fe 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -133,6 +133,23 @@ allOf:
> >              - const: uart
> >              - const: clk_uart_baud0
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> > +              - samsung,exynosautov9-uart
> > +    then:
> > +      properties:
> > +        samsung,uart-fifosize:
> > +          description: The fifo size supported by the UART channel.
> > +          $ref: /schemas/types.yaml#/definitions/uint32
> > +          enum: [16, 64, 256]
>
> We already have 'fifo-size' in several drivers. Use that. Please move
> its type/description definitions to serial.yaml and make drivers just do
> 'fifo-size: true' if they use it.

What do you suggest we do for the samsung,uart-fifosize property that
is being used upstream?

>
> > +
> > +      required:
> > +       - samsung,uart-fifosize
>
> A new required property is an ABI break. Please explain why that is okay
> in the commit message.
>

I can update the commit message to make clear there is an ABI break.
As mentioned above the platforms where this is now required are either
already setting the property or are new in this series. Is that
sufficient justification?

regards,

Peter

