Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA816D3838
	for <lists+linux-watchdog@lfdr.de>; Sun,  2 Apr 2023 16:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjDBOIE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 2 Apr 2023 10:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjDBOID (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 2 Apr 2023 10:08:03 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA68E2101;
        Sun,  2 Apr 2023 07:07:56 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id b19so19998009oib.7;
        Sun, 02 Apr 2023 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680444476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7B15INKB8AC0WvNQAJwAEt4dPDXXDrWRyaHlMHawklE=;
        b=Iz97xeL/OubG90LBmaaRh7TXDnKtqebjsx/xGgNt+08ZK/iANAKi5LCDNbl1kPGlhl
         76zTdC6AlqWggBjmxEsbU9vihRCqxJ2+SF7nMEbafNruYTPlfHHFZ3zxgTSW8TWFavpt
         qgpqy9beJvljbTk4P8ieEhcbq+gE+Pm/fxUlufjsQYqo19xC7XdcN/YeAZG5+kKDxT0o
         3wsMKzmU0O8CadMpw1dYOAuW1wtVaXHt6HCBQTTCEGM6eeyd/EBrRWu2PIoUT5YaTouH
         D3GMnpfBLYeqsJp6FQdHhYgQJ9tErvzo7uWl38c+1oQFOk9pMQzjay9VBHRFLr0zRlTc
         OYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680444476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B15INKB8AC0WvNQAJwAEt4dPDXXDrWRyaHlMHawklE=;
        b=tIjXvxT0baQYpQx3rVfL3pYDRCWaNRHM8lRqFAPaRSrWCEz+bxZrOFBM64Fh3AMQqB
         9QfKZDkQVYOkEkGdjV7b01WNLoCovCqJlyRZQ57Jzj9CejyFIdUdQ+T033KG6HMXI9cl
         Pg2vgyuwg+nbAMURMp0wob/QaHIOFGTWPO4RD2PyyLHf+tdHSadd15rAyl+XwXRWfpS7
         PttRdAmY+xDPGSt6bcnbvTESBRMCUzjfCq5lHI0qcBWlFxefzVBmcMbFnGtHPYvdOtF9
         RGRzvQBY38jW8E5hu0mIEis/INkwGA75VPMXzlO2b0BdFNRC4NGgEuImxThmvEEOAycq
         Z+bg==
X-Gm-Message-State: AAQBX9dXfmW9zYOK9CeORFqZoSZ/d9xmqOJHhTRIfQBYEZzZl5E14ykJ
        5nDNoNCGWVtBRCsSfTmc9baSdnae40dNsmnBZeMHZHSSseCVBNNv
X-Google-Smtp-Source: AKy350ayNFVUQvqBw0Rba4NNcJra3blaPe+BH1u8cNg9N4fexDIDiVeXiZXj8kr9yEjwevN1xvJpBn7y/IL/rb63rBc=
X-Received: by 2002:aca:909:0:b0:388:5e96:2f6a with SMTP id
 9-20020aca0909000000b003885e962f6amr5230663oij.0.1680444476068; Sun, 02 Apr
 2023 07:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230330182447.51674-1-n2h9z4@gmail.com> <471dfaaa-8ca5-c4a0-471d-8e4b12ed355b@linaro.org>
In-Reply-To: <471dfaaa-8ca5-c4a0-471d-8e4b12ed355b@linaro.org>
From:   n2 h9 <n2h9z4@gmail.com>
Date:   Sun, 2 Apr 2023 16:07:43 +0200
Message-ID: <CAJVoGU3n4NceuvqvMaMyZSchZMivpU8Pos0P4azMhNVuXF9MKQ@mail.gmail.com>
Subject: Re: [PATCH] Convert brcm,kona-wdt.txt to brcm,kona-wdt.yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello!

Thank you for your review Rob, Krzysztof.

Incorporated all reviews comments in v2 version of the patch
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230402135555.62507-1-n2h9z4@gmail.com/

Kind regards,
Nikita.
