Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E51B663F08
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jan 2023 12:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbjAJLKd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Jan 2023 06:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjAJLIz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Jan 2023 06:08:55 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D790EB05
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 03:08:50 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id i185so11862595vsc.6
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGBJdUhLvGpLg0IkWbTVUsItZJ0ILG7BPRGCq35WdVY=;
        b=OCdjplViRHw5/QVM3fLF2nUN8Ll8MQg7yYpencXyYMIHt5pfP5ORWguwC7/uiCMK7q
         ASBzrOgVRnTsbpj///14m3dT76BTCdu3DabPP+9oZvjkTUk9T05iLkPoSZMc4JsvvFUH
         +BrXlKkMm1nj6QYjHarChYOSdackUIJctyJNdZxExRqdPD1XTFd0IxSg8m5GDKm0EtaM
         CXQZEbCZXNuXHvNaYQuWEjPh5Z9TnsGKvdyxybyK0nooNSEIS8Md1LuHljCnrEayXLZA
         16POgiXyTD2D2i9Z9YYPcXVbuTJdA1bk4TZIgszIV1ZMkr9u1ItGqdz4iA9Xj52HKkaa
         tVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGBJdUhLvGpLg0IkWbTVUsItZJ0ILG7BPRGCq35WdVY=;
        b=jkTu0owWBcTOZLFjcJK1YcV36lFrr3diKI9YWlHu8+wptGGLRVDApz5J/gToGi72ug
         1HdHt5MtrGgvWitRCu30EdNETWmwzFxAGCXvToVdfstKeS1cHzS6RPPMuYm0BmxHXNWb
         HpfTkEF0b/BAnW848PSuf7mXbKdLbn1mkFkY4pR1QEZlr1qrTTIBnIAQPqQNSllOYTq2
         SMa1ZxpJkdzFO5NErhdgVGaetdzuZOD87S6TK6bQTDg11yiv//w68JA5ReWRAjKUsKOL
         9y2hRj+K2HcHIsFMWEabviIocr1Xe1RN03XUVvudVDPl2NR3Nhil9IhblBqDciPkskp4
         5G7Q==
X-Gm-Message-State: AFqh2kqAWeTvg4UtDXOUMK53zMQtYtj8nlZk83UkUxtfNNlXXTKoZB0q
        fidcFcxBfQh/X1YUiN3nuEDYUX6WZygcPwRQqhE=
X-Google-Smtp-Source: AMrXdXtU0IjbeC8kaa5mmw/h6FqColq39RQNJPS5ldZPBeDJzLqvrHwc/cRclVLGjsLrzWdDOghHXC2lFoJ4U89TrqI=
X-Received: by 2002:a05:6102:344:b0:3cb:c9e:5303 with SMTP id
 e4-20020a056102034400b003cb0c9e5303mr6339777vsa.34.1673348929773; Tue, 10 Jan
 2023 03:08:49 -0800 (PST)
MIME-Version: 1.0
Sender: eliudkiptoo836@gmail.com
Received: by 2002:a05:612c:220b:b0:366:d23a:b6f with HTTP; Tue, 10 Jan 2023
 03:08:49 -0800 (PST)
From:   TOM HUDDLESTON <tomhuddleston1jr@gmail.com>
Date:   Tue, 10 Jan 2023 14:08:49 +0300
X-Google-Sender-Auth: Wt5nFgg5zgjjuLWJHbU46z7l5HQ
Message-ID: <CAPwem6T6ycT--NgZ8Pc7V_bJ7r3o57Wf_DcXJWK35pi8utAx-A@mail.gmail.com>
Subject: Ich habe Ihnen bis zu 3 E-Mails gesendet
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Ich habe Ihnen 3 E-Mails bez=C3=BCglich Ihrer Spende gesendet, aber keine
Antwort. Bitte melden Sie sich mit Ihrem vollst=C3=A4ndigen Namen und Ihrer
WhatsApp-Nummer bei mir, um dieses Geld an Sie weiterzuleiten.

Ignorieren Sie diese Nachricht nicht, wenn Sie sie in Ihrem Spam oder
Posteingang finden

Gr=C3=BC=C3=9Fe
Tom Huddleston
